require 'active_support/inflector'

module Yify
  module Support
    module Utils

      def self.symbolize_keys(hash)
        hash.inject({}) do |options, (key, value)|
          options[(key.underscore.to_sym rescue key) || key] = value
          options
        end
      end

    end
  end
end
