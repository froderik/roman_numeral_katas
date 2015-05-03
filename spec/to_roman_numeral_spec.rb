require_relative 'spec_helper'

describe 'Decimal to roman numeral converter' do

  it 'should return I for 1' do
    expect( plsql.to_roman_numeral(1) ).to eq('I')
  end

  it 'should return II for 2' do
    expect( plsql.to_roman_numeral(2) ).to eq('II')
  end

end