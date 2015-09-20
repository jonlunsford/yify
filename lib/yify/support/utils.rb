require 'active_support/inflector'

module Yify
  module Support
    module Utils

      def symbolize_keys(request)
        if request.is_a?(Array)
          request.map { |item|  symbolize_keys(item) }
        else
          request.inject({}) do |result, (key, value)|
            new_key = key.class == String ? key.underscore.to_sym : key

            if value.is_a?(Hash)
              new_value = symbolize_keys(value)
            elsif value.is_a?(Array)
              new_value = value.map do |item|
                if item.is_a?(Hash)
                  symbolize_keys(item)
                else
                  item
                end
              end
            else
              new_value = value
            end

            result[new_key] = new_value
            result
          end
        end
      end

      def map_class(name)
        case name
        when :recently_downloaded
          :movie
        when :movies
          :movie
        when :request_list
          :movie
        when :upcoming_movies
          :movie
        when :movie_suggestions
          :movie
        else
          name
        end
      end

    end
  end
end
