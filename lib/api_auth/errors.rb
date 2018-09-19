# frozen_string_literal: true

module ApiAuth
  module Errors
    class ApiForbiddenError < StandardError; end
    class UnAuthenticateError < StandardError; end
  end
end
