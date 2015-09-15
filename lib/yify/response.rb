module Yify
  class Response
    include Yify::Support::Utils

    attr_reader :response, :result, :model

    def initialize(res, model)
      @model = model
      @response = res
      @result = {}

      normalized_response
    end

    private

    def normalized_response
      result = symbolize_keys(@response)
      result = extract(result[:data], @model)

      @result.clear
      @result = hydrate_model(result)
    end

    def hydrate_model(value)
      begin
        klass_s = map_class(@model).to_s.classify
        klass = "Yify::Models::#{klass_s}".constantize

        value.is_a?(Array) ? value.map { |val| klass.new(val) } : klass.new(value) unless value.nil?
      rescue
        value
      end
    end

    def extract(value, key)
      unless value.is_a?(Array)
        if value.has_key?(key)
          value[key]
        else
          value
        end
      else
        value
      end
    end

  end
end
