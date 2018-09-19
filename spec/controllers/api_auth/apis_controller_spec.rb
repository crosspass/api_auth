require 'rails_helper'

module ApiAuth
  RSpec.describe ApisController, type: :controller do
    routes { Engine.routes }

    before(:example) do
      @api = create(:api)
    end

    let(:valid_attributes) {
      {
        path: '/users'
      }
    }

    it 'GET #index' do
      get :index
      expect(response).to be_successful
    end

    it 'GET #show' do
      get :show, params: { id: @api.id }
      expect(response).to be_successful
    end

    it 'POST #create' do
      expect do
        post :create, params: { api: valid_attributes }
      end.to change(Api, :count).by(1)
      expect(response).to redirect_to(Api.last)
    end
  end
end
