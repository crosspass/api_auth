# frozen_string_literal: true

module ApiAuth
  ##
  # client's authorized apis
  class AuthorizedApi < ApplicationRecord
    has_many :requests
    belongs_to :client
    belongs_to :api
    validates_presence_of :api, :client
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
