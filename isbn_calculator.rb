class ISBNCalculator
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

  # Shortcut to get the final result
  def call
    adjust_checksum
  end
end

# Example usage with lambda:
isbn = "9780143007234"
calculator = ISBNCalculator.new(isbn)

# Using the call method directly
final_result = calculator.call
puts "Final result for ISBN #{isbn}: #{final_result}"

# Using a lambda to call the calculator
isbn_lambda = ->(isbn) { ISBNCalculator.new(isbn).call }

# Using the lambda
final_result_from_lambda = isbn_lambda.call("9780143007234")
puts "Final result from lambda: #{final_result_from_lambda}"
