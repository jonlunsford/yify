module Yify
  module Models
    class PersonBase < Base
      attribute :name, String
      attribute :small_image, String
      attribute :medium_image, String
      attribute :imdb_code, String
    end
  end
end

