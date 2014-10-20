module Yify
  module Models
    class Session < Base
      attribute :hash, String
      attribute :user_id, Integer
      attribute :user_role, String
      attribute :username, String
    end
  end
end
