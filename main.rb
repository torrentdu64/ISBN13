require_relative './services/isbn_calculator'

puts "Enter ISBN Number"
number = gets.chomp!

data = Service::ISBNCalculator.call(number)

puts data.result
