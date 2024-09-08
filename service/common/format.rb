
module Service
    module Common
        class Format 
            attr_reader :value, :instruction, :message, :errors

            def initialize(value, hash, errors)
                @value = value
                @instruction = hash[:format]
                @errors = errors
                @message = hash[:message]
            end

            def validate
               errors.add(:validation, message) if falsy 
            end

            def falsy
                !value.match?(instruction)
            end
        end
    end
end
 