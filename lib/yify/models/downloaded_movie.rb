module Yify
  module Models
    class DownloadedMovie < Base
      attribute :id, Integer
      attribute :url, String
      attribute :imdb_code, String
      attribute :title, String
      attribute :title_long, DateTime
      attribute :slug, DateTime
      attribute :year, String
      attribute :rating, Integer
      attribute :runtime, Integer
      attribute :genres, Array
      attribute :small_cover_image, String
      attribute :medium_cover_image, String
    end
  end
end

