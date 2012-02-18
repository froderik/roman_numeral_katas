var times = function(c, count){
  result = ''
  for (i = 0; i < count; i++){
    result += c
  }
  return result;
}

var singular_number = function(number, ones_sign, fives_sign, tens_sign){
  switch(number){
    case 0:
      return ''
    case 1:
    case 2:
    case 3:
      return times(ones_sign, number)
    case 4:
      return ones_sign + fives_sign
    case 5:
      return fives_sign
    case 6:
    case 7:
    case 8:
      return fives_sign + times( ones_sign, number - 5 )
    case 9:
      return ones_sign + tens_sign
  }
}

var numeral_to_roman = function(number){
  var thousands = Math.floor(number / 1000) % 10
  var hundreds  = Math.floor(number / 100 ) % 10
  var tens      = Math.floor(number / 10  ) % 10
  var ones      = number % 10

  var roman_thousands = times('M', thousands)
  var roman_hundreds  = singular_number( hundreds, 'C', 'D', 'M')
  var roman_tens      = singular_number( tens,     'X', 'L', 'C')
  var roman_ones      = singular_number( ones,     'I', 'V', 'X')
  
  console.log('' + roman_thousands + roman_hundreds + roman_tens + roman_ones)
}

numeral_to_roman(process.argv[2]);
