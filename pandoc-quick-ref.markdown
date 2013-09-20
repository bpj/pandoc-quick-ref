% Pandoc Markdown Quick Reference by Examples
% Benct Philip Jonsson\
  \<<bpjonsson@gmail.com>\>
% 18 September 2013

<!-- https://gist.github.com/bpj/6639231 -->

For the full official description see the [Pandoc User Guide]

This is a *really* quick reference without
explanations,[^exception] intended to remind new or returning
users who have already read the official User Guide.

This file lives as a [gist on Github](https://gist.github.com/bpj/6639231).

If you read it there bear in mind that it may contain markup
specific to Pandoc's Markdown dialect which the Github renderer
can't handle. (Currently there are only a couple of
[footnotes](#Footnotes).)

If you wonder why I'm using [Lipsum] everywhere in the examples
it is so as to make it easier to translate: you only have to
translate the headers and the table captions in the table
examples, and you're done!

The layout was also made with a mind to making it easy to
programmatically produce versions which show what the examples
look like when converted to various formats and when rendered.[^fileformat]



[Pandoc User Guide]: <http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown>
[Lipsum]:  <http://en.wikipedia.org/wiki/Lipsum>

[^exception]: I snuck in a use case for really ugly pipe tables, though!

Paragraphs
==========

	Et quia itaque unde quia est cupiditate deleniti quia.
	Accusamus iure nesciunt impedit accusamus.

	Libero sed impedit aut deserunt ipsum distinctio est.

Headers
=======

	Level one {#setext-level1-header}
	=========

	Level two
	---------

	# Level 1

	## Level 2

	# Level 1 #

	## Level 2 ##

	### Level three {#h3 .class1 .class2 attr1=val1 attr2=val2}

	###### Level six

Block quotes
============

	> Velit fuga facere sed error sed vitae consectetur. Et culpa voluptatem
	> optio dolores et. Voluptas aut facere et aut qui autem.
	>
	> > Repellendus quae deserunt odio tempora beatae facere. Blanditiis
	> > esse maxime enim.
	>
	> Mollitia praesentium repudiandae sunt blanditiis et sit est quibusdam.

Code Blocks
===========

	Quia qui eos odio soluta enim consequuntur voluptates tempore.

		print("This is an indented code block");

	Nesciunt dolores ut consequatur est accusantium et et sapiente.

	~~~ {#code-block .perl .numberlines attr1=val1 startFrom="2"}
	print("This is a fenced code block");
	~~~

	```perl
	print("This is a fenced code block");
	```

Line blocks
===========

	| possimus molestias.
	| dolorum ea.
	| consequatur explicabo.

Lists
=====

Unordered
----------

	*	rerum quia.
	*	repudiandae velit.
	+	facilis sint.
		-	quis vitae.
	+	enim voluptates.
	*	qui excepturi.

Ordered
--------

	C.	Quaerat aliquid _error_ voluptatem.

	I.	Libero et repudiandae autem adipisci.

		1)	Aut doloribus voluptatibus officiis minima.

		i. Eum delectus doloremque nostrum eveniet vel accusantium.

		ii. Dolorum dolor ut et est quis iusto magnam.

			(a) Asperiores deserunt omnis voluptatem fugiat quibusdam id.

			Repellendus qui voluptas doloribus corporis.

		1)	Enim et molestiae accusamus at quasi voluptatibus aut.

	II. Et saepe temporibus ad qui eum aliquid.

	D.	Dignissimos voluptatem autem qui.

	#.	Quisquam nobis ea repellendus incidunt enim sit doloremque dicta.
	#.	Sed reprehenderit non qui sunt.
	#.	Repudiandae numquam mollitia quia aspernatur est pariatur laudantium.

Definition lists
-----------------

	culpa
	~   Possimus molestiae illum quas ut soluta omnis velit qui.
	asperiores
	~   Commodi quidem nisi fugiat.
	~   Beatae aut aspernatur et autem aut.

	<!-- Two different lists! -->

	ad

	:	Laudantium laboriosam aspernatur rem occaecati quisquam.

	Qui placeat architecto animi ut nisi.

	magni

	:	Architecto laboriosam rerum non aut et dolorem.

	~~~~
	$x++;
	~~~~

	Omnis facilis dolores illo ab cum consectetur animi.

	velit

	:	Voluptatem quibusdam et soluta quia sed.

Example lists
-------------

	(@first)	Placeat nihil voluptas eos.
	(@second)	Eos consequuntur amet id et fugiat.

	Aliquam dolorem dolores aliquam non voluptate nemo hic (@first) ipsam.

	(@third)	Magni et vel provident officia eligendi at.

Horizontal rules
================

	* * *

	----

	__________

Tables
======

Simple tables
-------------

	Right	  Left	   Center	  Default
	-------		------ ----------	-------
	12	   12		 12			   12
	123		123		  123		   123
	1	  1			 1			   1

	Table:	Demonstration of simple table syntax.

Header-less tables
------------------

	-------		------ ----------	-------
	 12		12		  12			12
	123		123		  123		   123
	  1		1		   1
	-------		------ ----------	-------

	: Header-less table

Multi-line tables
-----------------

	-----------------------------------------------
	Saepe	Accusamus	Voluptatem
	------	----------	---------------------------
	Quis	Impedit		Laudantium incidunt ab iure
			recusandae.

	Tempore Inventore	Officiis facere officiis a.

	Ex		Et			Maxime eos natus iusto officia
			consequuntur et.
	-----------------------------------------------

	: Multi-line table

Grid tables
-----------

	+-------+-----------+---------------------------+
	|Saepe	|Accusamus	|Voluptatem					|
	+=======+===========+===========================+
	|Quis	|Impedit	|Laudantium incidunt ab iure|
	|		|			|recusandae.				|
	+-------+-----------+---------------------------+
	|Tempore|Inventore	|~~~						|
	|		|			|print("Officiis facere");	|
	|		|			|~~~						|
	+-------+-----------+---------------------------+
	|Ex		|Et			|Maxime eos natus iusto		|
	|		|			|officia consequuntur et.	|
	+-------+-----------+---------------------------+

	: Grid table

Pipe tables
-----------

	| Right | Left | Default | Center |
	|------:|:-----|---------|:------:|
	|	12	|  12  |	12	 |	  12  |
	|  123	|  123 |   123	 |	 123  |
	|	 1	|	 1 |	 1	 |	   1  |

	: Demonstration of pipe table syntax.

	|-----------|-----------|
	| Delectus	| Veritatis |
	| Laboriosam| Modi		|
	| Nam		| Quibusdam |

	: This is valid too

	| Delectus	| Veritatis |
	|-----------+-----------|
	| Laboriosam| Modi		|
	| Nam		| Quibusdam |

	: And this is valid

	--|--|--|--:
	saepe|ut|veniam|1.02
	eos|voluptatem|laborum|3.45
	non|voluptas|et|67.08

	: And even this is valid![^TSV]

	[^TSV]:	  Tab separated values to table in Vim:

	~~~{.vim}
	vip
	:'<,'>s/\t/|/g
	yyP
	:s/[^|]/-/g
	vip
	:'<,'>!pandoc -w markdown
	~~~

Title block
===========

	% Provident delectus eos
	% Praesentium Eos;
		Molestias Dolore;
		Consequatur Aut
	% 2011-11-11

YAML metadata block
===================

	---
	title:	'Corrupti: necessitatibus'
	author:
	  - name: Exercitationem Recusandae
	    affiliation: Omnis deserunt
	  - name: Sit Qui
	    affiliation: Sunt iusto
	tags: [nihil, rerum]
	abstract: |
	  Dolorum et ex ipsum explicabo voluptate dolore.

	  Velit sit distinctio nihil.
	...


Backslash escapes
=================

ASCII punctuation and symbol characters
---------------------------------------

	_unum_ ex _\*oinom_

Non-breaking space
------------------

	In\ quod

Line break
----------

	Non rerum voluptatem vitae\
	perspiciatis dolores voluptas enim.

Smart punctuation
=================

	Sapiente earum --- doloribus voluptatum --- quidem.

	1--2

	Consequatur...

Inline formatting
=================

Emphasis
--------

	Blanditiis _mollitia_ debitis suscipit ipsam at *eaque* dolore.

Strong emphasis
---------------

	Exercitationem quo __nemo__ dolorem sed **recusandae** debitis.

Strikeout
---------

	Ut ut ~~nisi id voluptatum~~ laboriosam et qui recusandae.

Superscripts and subscripts
---------------------------

	2^10^

	H~2~O

	Ea^eum\ quasi^

Verbatim
--------

	`foo = bar(3)`{#code .class1 .class2 attr1=val1 attr2=val2}

	``foo = `ls -l` ``

Math
----

	$2 \times 3$

Links
=====

Automatic links
---------------

	<http://example.com:2969commodi>

	<magni@example.org>

Inline links
------------

	Nihil voluptatum [reiciendis sunt accusamus](http://example.com:2969commodi) placeat dolorum fuga eos.

	Officiis [est](http://example.org:13666quasi "ut vel tenetur et maiores optio quisquam et atque.") et.

Reference links
---------------

	Iure facilis [quia][consequuntur] autem quos.

	Impedit quis [vitae][] pariatur.

	Perspiciatis [rerum] vel et suscipit.

	[consequuntur]: http://example.org/sapiente/consequatur
	[vitae]:		<http://ex.example.net:30796labore>
	[rerum]:		nihil@example.org

Internal links
--------------

	[amet](#velit)

	Fugiat [quod] quisquam earum.

	[quod]: #beatae

Images
======

	Itaque ![illum](eligendi.png) magnam sint.

	Itaque ![nihil] magnam sint.

	[nihil]: itaque.png

Pictures with captions
----------------------

	Laudantium ipsa eum odit in omnis aliquam.

	![Animi placeat sunt](iure.png)

	Blanditiis impedit qui corporis omnis vitae omnis dolor et.

Footnotes
=========

	Sint consequuntur[^1] illo nobis[^nobis] dolorem quibusdam.

	[^1]: Doloremque voluptatem ut molestiae consectetur.

	[^nobis]: Qui doloremque quo harum.

Inline notes
------------

	Est architecto veniam ea quia ratione^[Et sint corporis sapiente deserunt
	consequuntur.] accusantium voluptate expedita.


References
==========

	---
	references:
	  - id: doe99
	    title: About Something
	    author:
		  - family: Doe
		    given: John
	    issued:
	      year: 1999
	  - id: smith04
	    title: Things Explained
	    author:
	      - family: Smith
	        given: Thomas
	    issued:
	      year: 1904
	...

	Blah blah [see @doe99, pp. 33-35; also @smith04, ch. 1].

	Blah blah [@doe99, pp. 33-35, 38-39 and *passim*].

	Blah blah [@smith04; @doe99].

	Smith says blah [-@smith04].

	@smith04 says blah.

	@smith04 [p. 33] says blah.

	last paragraph...

	# References

	<!-- The bibliography will be inserted after this header. -->

[^fileformat]:  The file is formatted so that the actual examples, meant to
                be converted and possibly rendered to display what they
                become in various output formats are indented with hard
                (real) tab characters, while text which should merely be
                copied is flush left or indented with space characters,
                since I thought that as long as hard tabs are displayed
                four spaces wide that's less daunting for a newbie than
                fenced code blocks.  As long as this formatting is
                preserved the file can be divided into example chunks which
                match the (Perl) regular expression

                    / ^ \t .*? (?= ^ [^\t\n] | \z ) /msx

                and text chunks which match the 'inverse' expression

                    / ^ [^\t\n] .*? (?= ^ \t | \z ) /msx

                although you wold likely need to trim off trailing
                whitespace from each chunk and join them together again
                with two newlines between each chunk.  Example chunks can
                easily be outdented with `s/^\t//gm`.
