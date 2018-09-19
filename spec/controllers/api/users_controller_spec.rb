# frozen_string_literal: true

require 'rails_helper'
require 'json'

module Api
  RSpec.describe Api::UsersController, type: :controller do
    let(:headers) do
      client = create(:client_with_authorized_apis)
      {
        Authorization: "Token token=#{client.token}"
      }
    end

    let(:invalid_toke) do
      {
        Authorization: 'Token token=test'
      }
    end

    let(:user_attributes) do
      {
        'name': 't2',
       'email': 't2@t.cn'
      }
    end

    it 'request without token should failed' do
      get :index, xhr: true
      expect(response).to be_unauthorized
    end

    it 'request with invalid token' do
      request.headers.merge! invalid_toke
      get :index, xhr: true
      expect(response).to be_unauthorized
    end

    # TODO
    it 'request who\'s path is disabled should failed' do
    end

    it 'do GET request with valid token' do
      request.headers.merge! headers
      get :index, xhr: true
      users = JSON.parse(response.body)
      expect(response).to be_successful
      expect(users.size).to eq(0)
    end

    it 'request with disabled client' do
      client = create(:client_with_authorized_apis)
      client.disabled!
      header = {
        Authorization: "Token token=#{client.token}"
      }
      request.headers.merge! header
      get :index, xhr: true
      msg = JSON.parse(response.body)
      expect(msg['message']).to eq('client is disabled!')
      expect(response).to be_forbidden
    end

    it 'create user by api with valid token' do
      request.headers.merge! headers
      expect do
        post :create, xhr: true, params: { user: user_attributes }
      end.to change(User, :count).by(1)
      expect(response).to be_successful
    end

    it 'do PUT request with valid token' do
      request.headers.merge! headers
      user = create(:user)
      put :update, params: { id: user.id, user: { name: 'tk' } }, xhr: true
      user = JSON.parse(response.body)
      expect(user['name']).to eq('tk')
    end

    it 'do DELETE request with valid token' do
      request.headers.merge! headers
      user = create(:user)
      expect do
        delete :destroy, params: { id: user.id }, xhr: true
      end.to change(User, :count).by(-1)
      expect(response).to be_successful
    end
  end
end
