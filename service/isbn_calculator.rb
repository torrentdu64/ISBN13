require_relative './box'



module Service
  class ISBNCalculator < Service::Box
    attr_reader :isbn

    validates :isbn, presence: true,  message: "Value must be enter"
    validates :isbn, format: /^\d+$/, message: "Invalid code enter must contain digit"
    validates :isbn, length: 12, message: "Code must be 12 value"

  
    def initialize(isbn)
      @isbn = isbn
    end

    # Shortcut to get the final result
    def call
      calculate
    end
    
  private
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
      if success?
        puts "Final result for ISBN #{@isbn}: #{adjust_checksum}"
      else
        puts errors[:validation].join(', ')
      end
    end
  end
end

# Example usage ISBNCalculator:
# isbn = "9780143007234"
# calculator = ISBNCalculator.call(isbn)
