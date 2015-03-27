import os, strutils

proc `**`(number: int, symbol: string): string =
  if number == 0:
    ""
  else:
    symbol & ((number - 1) ** symbol)

proc singular_number(number: int, ones_symbol: string, fives_symbol: string, tens_symbol: string): string =
  case number
  of 1..3:
    number ** ones_symbol
  of 4:
    ones_symbol & fives_symbol
  of 5:
    fives_symbol
  of 6..8:
    fives_symbol & ((number - 5) ** ones_symbol)
  of 9:
    ones_symbol & tens_symbol
  else:
    ""

proc numeral_to_roman(number: int): string =
  let thousands = number div 1000 mod 10
  let hundreds  = number div 100  mod 10
  let tens      = number div 10   mod 10
  let ones      = number          mod 10

  let roman_thousands = thousands ** "M"
  let roman_hundreds  = singular_number( hundreds, "C", "D", "M" )
  let roman_tens      = singular_number( tens,     "X", "L", "C" )
  let roman_ones      = singular_number( ones,     "I", "V", "X" )

  roman_thousands & roman_hundreds & roman_tens & roman_ones


paramStr(1).parseInt().numeral_to_roman().echo
