module Yify
  module Models
    class MovieBase < Base
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
      attribute :date_uploaded, DateTime
      attribute :date_uploaded_unix, DateTime
      attribute :torrents, Array[Yify::Models::Torrent]
    end
  end
end

