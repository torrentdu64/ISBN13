class ISBNCalculator < Services::Object
  attr_reader :isbn

  def initialize(isbn)
    @isbn = isbn
  end

  # Step 1: Apply alternating multiplier of 1 and 3 to each digit
  def apply_alternating_multiplier
    multiplied_digits = []

    @isbn.chars.each_with_index do |digit, index|
      digit = digit.to_i
      multiplier = index.even? ? 1 : 3
      multiplied_digits << digit * multiplier
    end

    multiplied_digits
  end

  # Step 2: Sum the multiplied digits
  def sum_multiplied_digits
    apply_alternating_multiplier.sum
  end

  # Step 3: Calculate the checksum modulus (mod 10 of the sum)
  def calculate_checksum_modulus
    sum_multiplied_digits % 10
  end

  # Step 4: Adjust the checksum by subtracting from 10, with a special case for 10
  def adjust_checksum
    adjustment = 10 - calculate_checksum_modulus
    adjustment == 10 ? 0 : adjustment
  end

  def calculate
    puts "Final result for ISBN #{@isbn}: #{adjust_checksum}"
  end

  # Shortcut to get the final result
  def call
    calculate
  end
end

# Example usage ISBNCalculator:
isbn = "9780143007234"
calculator = ISBNCalculator.call(isbn)



