module Service
    module Common
        class Length 
            attr_reader :value, :instruction, :message, :errors

            def initialize(value, hash, errors)
                @value = value
                @instruction = hash[:length]
                @errors = errors
                @message = hash[:message]
            end

            def validate
              errors.add(:validation, message) if falsy  
            end

            def falsy
                !(value.length == instruction)
            end
        end
    end
end
