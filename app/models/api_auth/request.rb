module ApiAuth
  class Request < ApplicationRecord
    belongs_to :authorized_api
  end
end
