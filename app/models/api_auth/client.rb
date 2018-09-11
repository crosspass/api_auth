# frozen_string_literal: true

module ApiAuth
  ##
  # Third apart information
  # Third aprt apply api by email
  # developers or operators manage clients information
  class Client < ApplicationRecord
    validates_presence_of :name, :email, :desc
    has_secure_token
  end
end
