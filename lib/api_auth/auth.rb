# frozen_string_literal: true

require 'active_support/concern'
require_relative './errors'

module ApiAuth
  ##
  # Authenticate http request
  # request header contain `api-token`
  module Auth
    extend ActiveSupport::Concern
    include ActionController::HttpAuthentication::Token::ControllerMethods

    included do
      before_action :authenticate
      rescue_from ApiAuth::Errors::ApiForbiddenError, with: :render_403
      rescue_from ApiAuth::Errors::UnAuthenticateError, with: :render_401
    end

    protected

    def current_client
      @client
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, _|
        @client = ApiAuth::Client.find_by(token: token)
        raise unauthenticated_error unless @client
        raise client_disabled_error if @client.disabled?
        raise unauthorized_error if @client && !@client.allow_request?(request)
        true
      end
    end

    private

    def unauthorized_error
      ApiAuth::Errors::ApiForbiddenError.new("#{request.path} is not allowed!")
    end

    def unauthenticated_error
      ApiAuth::Errors::UnAuthenticateError.new('token is invalid!')
    end

    def client_disabled_error
      ApiAuth::Errors::ApiForbiddenError.new('client is disabled!')
    end


    def render_403(error)
      render json: { message: error.message }, status: 403
    end

    def render_401(error)
      render json: { message: error.message }, status: 401
    end
  end
end
