#!/bin/sh

cd en/

pandoc --toc -S --epub-metadata=../metadata.xml \
  -o ../learn-you-a-haskell-en.docx ../title.txt \
  01-introduction.md \
  02-starting-out.md \
  03-types-and-typeclasses.md \
  04-syntax-in-functions.md \
  05-recursion.md \
  06-higher-order-functions.md \
  07-modules.md \
  08-making-our-own-types-and-typeclasses.md \
  09-input-and-output.md \
  10-functionally-solving-problems.md \
  11-functors-applicative-functors-and-monoids.md \
  12-a-fistful-of-monads.md \
  13-for-a-few-monads-more.md \
  14-zippers.md

cd ../
