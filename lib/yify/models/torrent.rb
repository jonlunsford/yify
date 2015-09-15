module Yify
  module Models
    class Torrent < Base
      attribute :url, String
      attribute :hash, String
      attribute :quality, String
      attribute :resolution, String
      attribute :framerate, Float
      attribute :seeds, Integer
      attribute :peers, Integer
      attribute :size, String
      attribute :size_bytes, Integer
      attribute :download_count, Integer
      attribute :date_uploaded, DateTime
      attribute :date_uploaded_unix, DateTime
    end
  end
end
