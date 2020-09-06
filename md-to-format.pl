#!/usr/bin/env perl

use 5.014;

# use utf8;
use utf8::all;
use strict;
use warnings;
use warnings FATAL => 'utf8';
use autodie;

# use open qw[ :utf8 :std ];

use IPC::Run3 qw[ run3 ];    # To call pandoc

use Path::Tiny qw[ path ];   # To r/w files

# To split input into tab-indented an non-tab-indented chunks
use Text::Balanced qw[ extract_multiple ];

# To define/describe and process options
use Getopt::Long::Descriptive qw[ describe_options ];

my ( $opt, $usage ) = describe_options(
  'perl %c %o >quick-ref-FORMAT.md',
  [ 'format|f=s@',
    'A Pandoc output format to show. Repeatable. Required.',
    +{ required => 1 },
  ],
  [ 'input|i=s',
    'Name of input file. Default: pandoc-quick-ref.markdown',
    +{ default => 'pandoc-quick-ref.markdown' },
  ],
  [ 'output|o=s', 'Name of output file. Default: stdout', ],
  [ 'render|r:s',
    'Show the rendered markup. With clasd for div enclosing rendered text as optional argument.',
  ],
  [ 'latex-environment|latex-env|env|e=s',
    'LaTeX environment to put around rendered text, e.g. \'framed\'.',
  ],
  [ 'format-label|label|l=s%',
    'A FORMAT=LABEL pair, e.g. latex=\'\\LaTeX\'. Also e.g. rendered=Typeset',
    +{default => +{
        latex    => 'LaTeX',
        html     => 'HTML',
        rendered => 'Rendered',
      },
    },
  ],
  [ 'highlight-syntax|syntax|s=s%',
    'An OUTPUT_FORMAT=HIGHLIGHT_LANGUAGE pair',
  ],
  [ 'pandoc-arg|p=s@', 'An argument to pass to pandoc. Repeatable.', ],
  [ 'pandoc-executable|x=s',
    'The pandoc executable to use for conversion. Default: pandoc',
    +{ default => 'pandoc' },
  ],
  [ 'help|h', 'Show usage help and exit.', +{ shortcircuit => 1 }, ],
  +{getopt_conf   => [qw(no_auto_abbrev no_ignore_case no_bundling)],
    show_defaults => 0,
  },
);

use XXX;
WWW $opt;

print( $usage->text ), exit if $opt->help;

my $text = path( $opt->input )->slurp_utf8;

my @chunks = extract_multiple $text, [
  +{show => qr{
        (?:^\t.*\n)
        (?:^\t.*\n|^$ \n)*
        (?:^\t.*\n?)
      | (?:^\t.*\n?)
      }mx
  },
  qr{(?:^(?!\t).*\n?)+}m,
];

my @command = $opt->pandoc_executable;

if ( my $args = $opt->pandoc_arg ) {
  push @command, @$args;
}

my $formats = $opt->format;

unless ( grep {/^markdown$/} @$formats ) {
  unshift @$formats, 'markdown';
}

my $syntax_for = $opt->highlight_syntax // +{};
for my $fmt (@$formats) {
  $syntax_for->{$fmt} //= $fmt;
}

my $label_for = $opt->format_label // +{};
for my $fmt (@$formats) {
  $label_for->{$fmt} //= ucfirst $fmt;
}

my $render   = defined $opt->render;
my $rendered = $opt->render // 'rendered';

my $opts = +{
  binmode_stdin  => ':utf8',
  binmode_stdout => ':utf8',
};

my $fence = '`' x 72;

my($begin, $end) = ("", "");
if ( my $env = $opt->latex_environment ) {
  $begin = "```{=latex}\n\\begin{$env}\n```\n";
  $end = "```{=latex}\n\\end{$env}\n```\n";
}

my @out;

for my $chunk (@chunks) {
  if ( ref $chunk ) {
    my $code = $$chunk;
    $code =~ s/^\t//m;
    for my $fmt (@$formats) {
      my $markup;
      if ( 'markdown' eq $fmt ) {
        $markup = $code;
      }
      else {
        run3 [ @command, "--to=$fmt" ], \$code, \$markup, undef, $opts;
      }
      push @out,
          "$label_for->{$fmt}:\n\n$fence$syntax_for->{$fmt}\n$markup\n$fence\n\n";
    }
    if ($render) {
      push @out,
          "$label_for->{rendered}:\n\n:::$rendered\n$begin$code\n$end\:::\n\n";
    }
  }
  else {
    push @out, $chunk;
  }
}

my $new_text = join "", @out;

if ( my $fn = $opt->output ) {
  path($fn)->spew_utf8($new_text);
}
else {
  print $new_text;
}

