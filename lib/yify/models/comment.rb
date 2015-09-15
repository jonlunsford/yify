module Yify
  module Models
    class Comment < Base
      attribute :comment_id, Integer
      attribute :user_id, Integer
      attribute :username, String
      attribute :user_profile_url, String
      attribute :small_user_avatar_image, String
      attribute :medium_user_avatar_image, String
      attribute :user_group, String
      attribute :comment_text, String
      attribute :like_count, Integer
      attribute :date_added, DateTime
      attribute :date_added_unix, DateTime
    end
  end
end

