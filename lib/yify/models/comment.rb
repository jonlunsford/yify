module Yify
  module Models
    class Comment < Base
      attribute :comment_id, Integer
      attribute :comment_text, String
      attribute :date_added, DateTime
      attribute :date_added_epoch, DateTime
      attribute :user_id, Integer
      attribute :parent_comment_id, Integer
      attribute :user_name, String
      attribute :user_avatar, String
      attribute :user_group, String
    end
  end
end
