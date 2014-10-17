require 'active_support/inflector'

module Yify
  module Support
    module Utils

      def symbolize_keys(hash)
        hash.inject({}) do |result, (key, value)|
          new_key = key.class == String ? key.underscore.to_sym : key

          if value.is_a?(Hash)
            new_value = symbolize_keys(value)
          elsif value.is_a?(Array)
            new_value = value.map{ |item| symbolize_keys(item) }
          else
            new_value = value
          end

          result[new_key] = new_value
          result
        end
      end

    end
  end
end
