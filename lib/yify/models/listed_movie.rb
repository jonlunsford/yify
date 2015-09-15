module Yify
  module Models
    class ListedMovie < MovieBase
      attribute :background_image, String
      attribute :small_cover_image, String
      attribute :medium_cover_image, String
      attribute :state, String
    end
  end
end
