# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    include ApiAuth::Auth
    before_action :authenticate
  end
end
