require 'active_support/inflector'

module Yify
  module Support
    module Utils

      def symbolize_keys(hash)
        hash.inject({}) do |result, (key, value)|
          new_key = key.class == String ? key.underscore.to_sym : key

          new_value = case value
                      when Hash
                        symbolize_keys(value)
                      when Array
                        value.map{ |item| symbolize_keys(item) }
                      else
                        value
                      end

          result[new_key] = new_value
          result
        end
      end

    end
  end
end
