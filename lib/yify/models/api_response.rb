module Yify
  module Models
    class ApiResponse < Base
      attribute :status, String
      attribute :error, String
    end
  end
end
