module Yify
  module Models
    class Movie < Base
      attribute :age_rating, String
      attribute :cast_list, String
      attribute :cover_image, String
      attribute :date_uploaded, DateTime
      attribute :date_uploaded_epoch, DateTime
      attribute :director_list, String
      attribute :downloaded, Integer
      attribute :frame_rate, Float
      attribute :genre1, String
      attribute :genre2, String
      attribute :imdb_code, String
      attribute :imdb_link, String
      attribute :language, String
      attribute :large_cover, String
      attribute :large_screenshot1, String
      attribute :large_screenshot2, String
      attribute :large_screenshot3, String
      attribute :long_description, String
      attribute :medium_cover, String
      attribute :medium_screenshot1, String
      attribute :medium_screenshot2, String
      attribute :medium_screenshot3, String
      attribute :movie_count, String
      attribute :movie_id, Integer
      attribute :movie_rating, Float
      attribute :movie_runtime, Integer
      attribute :movie_title, String
      attribute :movie_title_clean, String
      attribute :movie_url, String
      attribute :movie_year, String
      attribute :quality, String
      attribute :resolution, String
      attribute :short_description, String
      attribute :size, String
      attribute :size_byte, Integer
      attribute :state, String
      attribute :subtitles, String
      attribute :torrent_hash, String
      attribute :torrent_magnet_url, String
      attribute :torrent_peers, String
      attribute :torrent_seeds, String
      attribute :torrent_url, String
      attribute :uploader, String
      attribute :uploader_uid, Integer
      attribute :uploader_notes, String
      attribute :youtube_trailer_id, String
      attribute :youtube_trailer_url, String
    end
  end
end
