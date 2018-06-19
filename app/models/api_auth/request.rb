module ApiAuth
  class Request < ApplicationRecord
    belongs_to :client
    belongs_to :api
  end
end
