# frozen_string_literal: true

module ApiAuth
  ##
  # Third apart information
  # Third aprt apply api by email
  # developers or operators manage clients information
  class Client < ApplicationRecord
    validates_presence_of :name, :email, :desc
    has_many :authorized_apis
    has_secure_token
    enum status: %i[active, disabled]

    ##
    def allow_request?(request)
      authorized_apis.find do |authorized_api|
        authorized_api.allow_request?(request)
      end.present?
    end
  end
end
