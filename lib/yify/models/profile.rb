module Yify
  module Models
    class Profile < User
      attribute :num_of_votes_left
      attribute :profile_active
      attribute :ip_address
      attribute :num_of_requests_left
    end
  end
end
