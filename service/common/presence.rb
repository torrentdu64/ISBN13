require_relative '../box'  # Adjust this path as needed


module Service
    module Common
        class Presence
            attr_reader :value, :instruction, :message, :errors

            def initialize(value, hash, errors)
                @value = value
                @instruction = hash[:presence]
                @errors = errors
                @message = hash[:message]
            end

            def validate
                errors.add(:validation, message) if falsy     
            end 

            def falsy
                if instruction
                    value.nil? && value.strip.empty?
                else
                    true
                end
            end
        end  
    end
end   
