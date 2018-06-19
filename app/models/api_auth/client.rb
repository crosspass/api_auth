class ApiAuth::Client < ApplicationRecord
  has_secure_token :token
  has_and_belongs_to_many :apis
  has_many :requests

  validates :name, uniqueness: true, presence: true
  validates :developer, presence: true

  #before_create :set_token

  private

  def set_token
    self.token = generate_token
  end

  def generate_token
    'a' * 32
  end
end
