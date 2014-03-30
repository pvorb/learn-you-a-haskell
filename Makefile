DOCGEN=pandoc
DOCGEN_FLAGS=--toc -S

FILES=01-introduction.md 02-starting-out.md 03-types-and-typeclasses.md 04-syntax-in-functions.md 05-recursion.md 06-higher-order-functions.md 07-modules.md 08-making-our-own-types-and-typeclasses.md 09-input-and-output.md 10-functionally-solving-problems.md 11-functors-applicative-functors-and-monoids.md 12-a-fistful-of-monads.md 13-for-a-few-monads-more.md 14-zippers.md

all: epubs pdfs

epubs: epub-en
epub-en: out pandoc metadata.xml
	$(DOCGEN) $(DOCGEN_FLAGS) --epub-metadata=metadata.xml -o out/lyah-en.epub $(addprefix en/, $(FILES))

pdfs: pdf-en
pdf-en: out en pandoc pdflatex 
	$(DOCGEN) $(DOCGEN_FLAGS) -o out/lyah-en.pdf $(addprefix en/, $(FILES))

out:
	mkdir out

pandoc:
	@which pandoc > /dev/null

pdflatex:
	@which pdflatex > /dev/null

clean:
	rm -rf out
