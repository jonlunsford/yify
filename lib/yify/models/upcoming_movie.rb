module Yify
  module Models
    class UpcomingMovie < Base
      attribute :title, String
      attribute :year, String
      attribute :imdb_code, String
      attribute :medium_cover_image, String
      attribute :date_added, DateTime
      attribute :date_added_unix, DateTime
    end
  end
end
