module Yify
  module Models
    class User < Base
      attribute :id, String
      attribute :username, String
      attribute :group, String
      attribute :url, String
      attribute :about_text, String
      attribute :small_avatar_image, String
      attribute :medium_avatar_image, String
      attribute :date_joined, DateTime
      attribute :date_joined_unix, DateTime
      attribute :recently_downloaded, Array[Yify::Models::DownloadedMovie]
    end
  end
end

