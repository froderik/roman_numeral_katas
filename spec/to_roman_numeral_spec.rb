require_relative 'spec_helper'

describe 'Decimal to roman numeral converter' do

  roman_numbers = %w{0 I II III IV V VI VII VIII IX X XI XII XIII XIV XV XVI XVII XVIII XIX}
  (1..19).each do |given|
    expected = roman_numbers[given]
    it "should return #{expected} for #{given}" do
      expect( plsql.to_roman_numeral(given) ).to eq( expected )
    end

  end


end