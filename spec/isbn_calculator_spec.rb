require_relative './spec_helper'

RSpec.describe Service::ISBNCalculator do

    context ".initialize" do
        it "should return isbn value" do
            calculator =  Service::ISBNCalculator.new("123456789")

            expect(calculator.isbn).not_to be_empty 
        end
    end

    describe ',apply_alternating_multiplier ' do
        context 'multiply alternatively between 1 and 3 each digit' do
            it 'result expected' do
                calculator =  described_class.new("9780143007234")
                result = calculator.send(:apply_alternating_multiplier)  

                expect(result).to eq([9, 21, 8, 0, 1, 12, 3, 0, 0, 21, 2, 9, 4]) 
            end
        end
    end

    describe ".sum_multiplied_digits" do
        context " Sum the multiplied digits" do
            it "return correct result" do
                calculator =  described_class.new("9780143007234")
                result = calculator.send(:sum_multiplied_digits)  
                
                expect(result).to eq(90) 
            end
        end
    end 

    describe ".calculate_checksum_modulus" do
        context "modulus 10 of the sum" do
            it "return correct result" do
                calculator =  described_class.new("9780143007234")
                result = calculator.send(:calculate_checksum_modulus)  
                
                expect(result).to eq(0) 
            end
        end
    end 

    describe ".adjust_checksum" do
        context "substract .calculate_checksum_modulus to 10" do
            it "return 0" do
                calculator =  described_class.new("9780143007234")
                result = calculator.send(:adjust_checksum)  
                
                expect(result).to eq(0) 
            end
        end
    end

   describe ".calculate" do
        context "when the ISBN is valid" do
            it "prints the final result" do
                calculator = described_class.new("9780143007234")

                expect { calculator.send(:calculate) }.to output("Final result for ISBN 9780143007234: 0\n").to_stdout
            end
        end

        context "when the ISBN is invalid" do
            it "prints validation errors" do
              calculator = described_class.new("")
              calculator.validate_fields(calculator.errors)

              expected_output = "Value must be enter, Invalid code enter must contain digit, Code must be 13 value\n"
              expect { calculator.send(:calculate) }.to output(expected_output).to_stdout
            end
        end
    end

    describe ".call" do
        context "when the ISBN is valid" do
          it "prints the final result" do
            calculator = described_class.call("9780143007234")
      
            expect { calculator.send(:calculate) }.to output("Final result for ISBN 9780143007234: 0\n").to_stdout
          end
        end
      
        context "when the ISBN is invalid" do
          it "prints validation errors" do
            calculator = described_class.call("")
            calculator.validate_fields(calculator.errors)
      
            expected_output = "Value must be enter, Invalid code enter must contain digit, Code must be 13 value\n"
            expect { calculator.send(:calculate) }.to output(expected_output).to_stdout
          end
        end
      end
      
end

 