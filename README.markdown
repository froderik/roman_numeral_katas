# Numeral to roman in different languages

This repo is a collection of implementations of the roman numeral kata in different programming languages. The kata is basically about converting an arabic number like 1, 42 or 666 to its roman counterpart. To make this easier there is a test script written in ruby that ensures that each impementation is correct. Run it without any argument and it will run tests on all the implementations. To run just one language just use that folder name as the one and only argument to the script. For example: `./numeral_to_roman_test.rb ruby` . The following sections describe what you need to set up on your computer to run each of the languages. The test scripts expect some kind of program or script in the target folder that is called `numeral_to_roman`. In addiation - if the language is compiled - the script `before` will be run so that compilation only occurs once. And many of the scripts expect there to be a bash in /bin.

## bash
* well - bash is needed....

## C
* gcc 4.2.1 that comes with MacOSX 10.6.5. Would probably work with any gcc.

## clojure
* java 1.6.0.17 that comes with MacOSX 10.6.5. The clojure jar is in the repo.

## erlang
* `sudo brew install erlang` installed erlang 5.8.2

## go
* `sudo brew install go` if mercurial is installed

## haskell
* `sudo brew install ghc`

## java
* java 1.6.0.17 that comes with MacOSX 10.6.5. Any Java version will probably work fine.

## ruby 
* 1.9.2 instaled with rvm - should probably run with 1.8 as well
