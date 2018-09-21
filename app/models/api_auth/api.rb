# frozen_string_literal: true

class ApiAuth::Api < ApplicationRecord
  has_many :requests
  has_and_belongs_to_many :clients
  validates :path, presence: true

  def allowed_methods
    allowed_request_methods = []
    allowed_request_methods << 'GET' if GET?
    allowed_request_methods << 'POST' if POST?
    allowed_request_methods << 'PUT' if PUT?
    allowed_request_methods << 'DELETE' if DELETE?
    allowed_request_methods
  end
end
