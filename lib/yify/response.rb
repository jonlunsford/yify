module Yify
  class Response
    include Yify::Support::Utils

    attr_reader :response, :result

    def initialize(res)
      @response = res
      @result = {}
    end

    private

    def normalize_response
      result = @response.to_hash
      result = symbolize_keys(result)

      @result.clear

      result.each_pair do |key, value|
        @result[key] = hydrate_model(key, value)
      end
    end

    def hydrate_model(key, value)
      begin
        klass_s = key.classify
        klass = "Yify::Models::#{klass_s}".constantize

        value.is_a?(Array) ? value.map { |val| klass.new(val) } : klass.new(value) unless value.nil?
      rescue
        value
      end
    end
  end
end
