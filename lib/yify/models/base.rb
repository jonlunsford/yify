require 'virtus'

module Yify
  module Models
    class Base
      include Virtus.model
      include Yify::Support::Utils

      def initialize(params)
        self.extend(Virtus.model)

        params.each do |key, value|
          klass = map_class(key)

          begin Yify::Models.const_get klass.to_s.classify
            attribute key, Array[Yify::Models.const_get klass.to_s.classify]
          rescue
            attribute key, value.class
          end

          self[key] = value
        end
      end

    end
  end
end

