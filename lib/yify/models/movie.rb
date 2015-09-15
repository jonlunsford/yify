module Yify
  module Models
    class Movie < Base
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
      attribute :language, String
      attribute :mpa_rating, String
      attribute :download_count, Integer
      attribute :like_count, Integer
      attribute :rt_critics_score, Integer
      attribute :rt_critics_rating, String
      attribute :rt_audience_score, Integer
      attribute :rt_audience_rating, String
      attribute :description_intro, String
      attribute :description_full, String
      attribute :yt_trailer_code, String
      attribute :date_uploaded, DateTime
      attribute :date_uploaded_unix, DateTime
      attribute :background_image, String
      attribute :small_cover_image, String
      attribute :medium_cover_image, String
      attribute :state, String
      attribute :torrents, Array
    end
  end
end
