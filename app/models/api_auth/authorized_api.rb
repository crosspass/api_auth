class ApiAuth::AuthorizedApi < ApplicationRecord
  has_many :requests
  belongs_to :client
  belongs_to :api
end
