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
    1479 => "MCDLXXIX",
    2010 => "MMX"
  }
  
  puts '===================================='
  puts 'Running tests in ' + name
  failed_tests = 0
  roman_test_data.keys.each do |numeral|
    roman = roman_test_data[numeral]
    command = "./numeral_to_roman " + numeral.to_s
    stream = open "|" + command
    from_stream = stream.gets
    if from_stream.nil?
      puts name + " answers without words"
    else
      roman_result = from_stream.chop
      stream.close
      if roman != roman_result 
        puts numeral.to_s + " should be " + roman.to_s + " but is " + roman_result.to_s 
        failed_tests = failed_tests.next
      end
    end
  end
  puts "Ran " + roman_test_data.size.to_s + " tests " + failed_tests.to_s + " tests failed"
end

def change_directory_and_run_tests name
  Dir.chdir name
  run_test_in_one_directory name
  Dir.chdir '..'
end

if ARGV.size > 0
  cwd = ARGV
else
  cwd = Dir.new '.'
end
cwd.each do |name|
  is_sub = (name[0,1] != '.' and name != '..' and File.directory?(name))
  if is_sub
    change_directory_and_run_tests name
  end
end