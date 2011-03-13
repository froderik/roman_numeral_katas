-module(numeral_to_roman).
-export([convert/1]).

convert( Number ) -> 
  times( "M", Number div 1000) ++ 
  one_number( "C", "D", "M", Number div 100 rem 10) ++
  one_number( "X", "L", "C", Number div 10 rem 10) ++
  one_number( "I", "V", "X", Number rem 10).

times( Symbol, 0 ) -> "";
times( Symbol, Count ) -> 
  times( Symbol, Count - 1 ) ++ Symbol.

one_number( Ones, Fives, Tens, 0 ) -> "";
one_number( Ones, Fives, Tens, 1 ) -> Ones;
one_number( Ones, Fives, Tens, 2 ) -> Ones ++ Ones;
one_number( Ones, Fives, Tens, 3 ) -> Ones ++ Ones ++ Ones;
one_number( Ones, Fives, Tens, 4 ) -> Ones ++ Fives;
one_number( Ones, Fives, Tens, 5 ) -> Fives;
one_number( Ones, Fives, Tens, 6 ) -> Fives ++ Ones;
one_number( Ones, Fives, Tens, 7 ) -> Fives ++ Ones ++ Ones;
one_number( Ones, Fives, Tens, 8 ) -> Fives ++ Ones ++ Ones ++ Ones;
one_number( Ones, Fives, Tens, 9 ) -> Ones ++ Tens.
