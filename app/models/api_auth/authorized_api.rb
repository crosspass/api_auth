# frozen_string_literal: true

module ApiAuth
  ##
  # client's authorized apis
  class AuthorizedApi < ApplicationRecord
    has_many :requests
    belongs_to :client
    belongs_to :api
    validates_presence_of :api, :client
  end
end
