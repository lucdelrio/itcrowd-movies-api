require 'rails_helper'

RSpec.describe RomanConverter do
  include RomanConverter

  describe 'convert_to_roman' do
    it 'converts 2016 ok' do
      expect(convert_to_roman(2012)).to eq('MMXII')
    end

    it 'converts 1999 ok' do
      expect(convert_to_roman(1999)).to eq('MCMXCIX')
    end

    it '-10 convertion return 0' do
      expect(convert_to_roman(-10)).to eq('0')
    end
  end
end