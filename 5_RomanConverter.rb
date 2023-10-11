class RomanConverter
  ROMAN_TO_INT = {
    'I' => 1,
    'IV' => 4,
    'V' => 5,
    'IX' => 9,
    'X' => 10,
    'XL' => 40,
    'L' => 50,
    'XC' => 90,
    'C' => 100,
    'CD' => 400,
    'D' => 500,
    'CM' => 900,
    'M' => 1000
  }.freeze

  INT_TO_ROMAN = {
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

  def self.to_int(roman_number)
    result = 0
    index = 0

    while index < roman_number.length
      if index + 1 < roman_number.length && ROMAN_TO_INT.include?(roman_number[index..index + 1])
        result += ROMAN_TO_INT[roman_number[index..index + 1]]
        index += 2
      else
        result += ROMAN_TO_INT[roman_number[index]]
        index += 1
      end
    end

    result
  end

  def self.to_roman(number)
    result = ''

    INT_TO_ROMAN.each do |value, roman|
      while number >= value
        result += roman
        number -= value
      end
    end

    result
  end
end



roman_number = 'MCMXC'
converted_number = RomanConverter.to_int(roman_number)
puts "Римське число #{roman_number} в форматі цілого: #{converted_number}"

number = 1666
converted_roman_number = RomanConverter.to_roman(number)
puts "Ціле число #{number} в форматі римського: #{converted_roman_number}"