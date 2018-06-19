class ApiAuth::Api < ApplicationRecord
  has_many :requests
  has_and_belongs_to_many :clients
  validates :path, presence: true
end
