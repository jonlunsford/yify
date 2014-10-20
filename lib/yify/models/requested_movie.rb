module Yify
  module Models
    class RequestedMovie < UpcomingMovie
      attribute :cover_image, String
      attribute :short_description, String
      attribute :movie_count, String
      attribute :request_id, String
      attribute :movie_rating, String
      attribute :movie_year, String
      attribute :votes, String
      attribute :genre, String
      attribute :movie_title_clean, String
      attribute :user_id, String
      attribute :user_name, String
    end
  end
end
