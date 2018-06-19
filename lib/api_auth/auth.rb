# frozen_string_literal: true

require 'active_support/concern'
require_relative './api_forbidden_error'

module ApiAuth
  ##
  # Authenticate http request
  # request header contain `api-token`
  module Auth

    extend ActiveSupport::Concern

    included do
      before_action :authenticate
      rescue_from ApiAuth::ApiForbiddenError, with: :render_403
    end


    protected

    def current_client
      @client
    end

    def authenticate
      @client = ApiAuth::Client.find_by(token: header_token)
      if @client
        raise not_allowd_error unless client.apis.include?(request.path)
      else
        raise client_not_found_error
      end
      true
    end

    def header_token
      request.headers['api-token']
    end

    private

    def not_allowed_error
      ApiAuth::ApiForbiddenError.new("#{request.path} is not allowed!")
    end

    def client_not_found_error
      ApiAuth::ApiForbiddenError.new("#{header_token} is not found!")
    end

    def render_403(e)
      render json: { message: "#{e.message}"}, status: 403
    end
  end
end
