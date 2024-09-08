
require_relative './presence'
require_relative './format'
require_relative './length'

require 'pry'


module Service
  module Common
    class Validators 
    
      def self.inherited(base)
        base.instance_variable_set(:@validations, @validations&.dup || {})
      end

      def self.validates(value, **validation)
        @validations[value] ||= []
        @validations[value] << validation
      end

      def self.validations
        @validations
      end
  
      # Instance method for validating fields
      def validate_fields(errors)
        self.class.validations.each do |field, validations|
          value = instance_variable_get("@#{field}")
      
          validations.each do |validation|
            validation.each do |validator_name, instruction|
              next if validator_name == :message
      
              class_name = validator_name.to_s.capitalize
              if Service::Common.const_defined?(class_name)
                validator_class = Service::Common.const_get(class_name)
                validator_class.new(value, validation, errors).validate
              else
                raise "Validator #{class_name} is not defined."
              end
            end
          end
        end
      end
    end
  end
end