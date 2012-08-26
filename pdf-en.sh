#!/bin/sh

pandoc --toc -S -o learn-you-a-haskell-en.pdf title.txt \
  en/01-introduction.md \
  en/02-starting-out.md \
  en/03-types-and-typeclasses.md \
  en/04-syntax-in-functions.md \
  en/05-recursion.md \
  en/06-higher-order-functions.md \
  en/07-modules.md \
  en/08-making-our-own-types-and-typeclasses.md \
  en/09-input-and-output.md \
  en/10-functionally-solving-problems.md \
  en/11-functors-applicative-functors-and-monoids.md \
  en/12-a-fistful-of-monads.md \
  en/13-for-a-few-monads-more.md \
  en/14-zippers.md
