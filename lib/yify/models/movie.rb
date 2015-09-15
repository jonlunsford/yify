module Yify
  module Models
    class Movie < MovieBase
      attribute :download_count, Integer
      attribute :like_count, Integer
      attribute :rt_critics_score, Integer
      attribute :rt_critics_rating, String
      attribute :rt_audience_score, Integer
      attribute :rt_audience_rating, String
      attribute :description_intro, String
      attribute :description_full, String
      attribute :yt_trailer_code, String
      attribute :images, Hash[Symbol => String]
      attribute :directors, Array[Yify::Models::Director]
      attribute :actors, Array[Yify::Models::Actor]
    end
  end
end
