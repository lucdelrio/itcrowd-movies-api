module RomanConverter
  ROMAN_NUMBERS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  def convert_to_roman(number)
    return '0' if number < 1

    roman = ''
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter * (number / value)
      number = number % value
    end
    roman
  end
end
