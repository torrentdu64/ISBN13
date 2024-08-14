require_relative './service/isbn_calculator'

puts "Enter ISBN Number"
number = gets.chomp!

data = Service::ISBNCalculator.call(number)

puts data.result
