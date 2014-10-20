module Yify
  module Models
    class UpcomingMovie < Base
      attribute :movie_title, String
      attribute :movie_cover, String
      attribute :imdb_code, String
      attribute :imdb_link, String
      attribute :uploader, String
      attribute :uploader_uid, Integer
      attribute :date_added, DateTime
      attribute :date_added_epoch, DateTime
      attribute :username, String
    end
  end
end
