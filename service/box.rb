
require_relative './common/errors'
require_relative './common/validators'


module Service
  class Box < Common::Validators

    class << self
      def call(*arg)
        new(*arg).constructor
      end
    end

    attr_reader :result
    def constructor
      validate_fields( errors )
      @result = call
      self
    end

    def success?
      !failure?
    end

    def failure?
      errors.any?
    end

    def errors
      @errors ||= Service::Common::Errors.new
    end

    def call
      fail NotImplementedError unless defined?(super)
    end
  end
end
