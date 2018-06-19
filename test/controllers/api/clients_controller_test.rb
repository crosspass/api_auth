require 'test_helper'

module Api
  class ClientsControllerTest < ActionDispatch::IntegrationTest
    test 'request header without api token respond 403' do
      get api_clientso_url
      assert_response 403
    end

    test 'request header with invalid api token respond 403' do
    end
  end
end
