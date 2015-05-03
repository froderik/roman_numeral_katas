require_relative 'spec_helper'

describe 'Decimal to roman numeral converter' do

  [
      [ 1,    'I'],
      [ 2,   'II'],
      [ 3,  'III'],
      [ 4,   'IV'],
      [ 5,    'V'],
      [ 6,   'VI'],
      [ 7,  'VII'],
      [ 8, 'VIII'],
      [ 9,   'IX'],
      [10,    'X'],
  ].each do |given, expected|
    it "should return #{expected} for #{given}" do
      expect( plsql.to_roman_numeral(given) ).to eq( expected )
    end

  end


end