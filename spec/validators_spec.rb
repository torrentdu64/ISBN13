require_relative './spec_helper'

RSpec.describe Service::Common::Validators do
  before do
    class TestValidator < Service::Common::Validators
      attr_accessor :value

      validates :value, presence: true, message: "Value must be present"
      validates :value, length: 5, message: "Value must be 5 characters long"

      def initialize(value)
        @value = value
      end
    end
  end

  describe '.validates' do
    context 'when a validation is added' do
      it 'should add the correct validation to the validations hash' do
        expect(TestValidator.validations).to eq({
          :value => [
            { presence: true, message: "Value must be present" },
            { length: 5, message: "Value must be 5 characters long" }
          ]
        })
      end
    end
  end

  describe '#validate_fields' do
    let(:errors) { Service::Common::Errors.new }

    context 'when validations pass' do
      it 'should not add any errors' do
        validator = TestValidator.new('12345')
        validator.validate_fields(errors)
        expect(errors).to be_empty
      end
    end

    context 'when validations fail' do
      it 'should add errors to the errors object' do
        validator = TestValidator.new('123')
        validator.validate_fields(errors)
        expect(errors[:validation]).to include("Value must be 5 characters long")
      end

      it 'should add the correct presence error message' do
        validator = TestValidator.new('')
        validator.validate_fields(errors)
        expect(errors[:validation]).to include("Value must be present")
      end
    end
  end

  after do
    Object.send(:remove_const, :TestValidator)
  end
end
