module Yify
  class Response
    include Yify::Support::Utils

    attr_reader :response, :result, :model

    def initialize(res, model)
      @model = model
      @response = res
      @result = {}

      normalize_response
    end

    private

    def normalize_response
      result = @response
      result = symbolize_keys(result)
      @result.clear
      
      if result.is_a?(Hash)
        @result = hydrate_model(result)
      else
        result.each_pair do |key, value|
          @result[key] = hydrate_model(key, value)
        end
      end
    end

    def hydrate_model(value)
      begin
        klass_s = @model.to_s.classify
        klass = "Yify::Models::#{klass_s}".constantize

        value.is_a?(Array) ? value.map { |val| klass.new(val) } : klass.new(value) unless value.nil?
      rescue
        value
      end
    end

  end
end
