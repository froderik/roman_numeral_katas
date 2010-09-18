#!/usr/bin/ruby


def run_test_in_one_directory name
  roman_test_data = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    9 => 'IX',
    10 => 'X',
    12 => 'XII',
    14 => 'XIV',
    15 => "XV",
    16 => "XVI",
    19 => "XIX",
    20 => "XX",
    26 => "XXVI",
    29 => "XXIX",
    42 => "XLII",
    49 => "XLIX",
    77 => "LXXVII",
    99 => "XCIX",
    101 => "CI",
    256 => "CCLVI",
    493 => "CDXCIII",
    999 => "CMXCIX",
    1972 => "MCMLXXII",
    2010 => "MMX"
  }
  
  puts '===================================='
  puts 'Running tests in ' + name
  roman_test_data.keys.each do |numeral|
    roman = roman_test_data[numeral]
    stream = open "|" + "./numeral_to_roman " + numeral.to_s
    roman_result = stream.gets.chop
    stream.close
    puts numeral.to_s + " should be " + roman.to_s + " but is " + roman_result.to_s if( roman != roman_result )
  end
  puts "Ran " + roman_test_data.size.to_s + " tests"
end

cwd = Dir.new '.'
cwd.each do |name|
  is_sub = (name != '.' and name != '..' and File.directory?(name))
  if is_sub
    Dir.chdir name
    run_test_in_one_directory name
    Dir.chdir '..'
  end
end