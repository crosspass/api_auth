# frozen_string_literal: true

module ApiAuth
  ##
  # client's authorized apis
  class AuthorizedApi < ApplicationRecord
    has_many :requests
    validates_presence_of :api, :client
    validates :api, uniqueness: { scope: :client_id }

    belongs_to :client
    belongs_to :api
    delegate :path, to: :api

    ##
    # path /users
    # path /users/:id
    def allow_request?(request)
      path_regx = path.gsub(':id', '\w+')
      request.path.match(/#{path_regx}/).present? && public_send("#{request.method}?")
    end
  end
end
