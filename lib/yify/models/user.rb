module Yify
  module Models
    class User < Base
      attribute :about, String
      attribute :avatar, String
      attribute :chat_time_seconds, Integer
      attribute :comment_count, Integer
      attribute :join_dated, DateTime
      attribute :join_dated_epoch, DateTime
      attribute :last_seen_date, DateTime
      attribute :last_seen_date_epoch, DateTime
      attribute :movies_requested_count, Integer
      attribute :torrents_downloaded_count, Integer
      attribute :user_id, Integer
      attribute :user_name, String
      attribute :user_role, String
    end
  end
end
