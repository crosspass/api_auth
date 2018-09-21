require 'rails_helper'

module ApiAuth
  RSpec.describe Client, type: :model do
    it 'add api' do
      client = create(:client)
      api = create(:api)
      expect {
        client.toggle_api(api, 'PUT' => true)
      }.to change { client.authorized_apis.size }.by(1)
      expect(client.authorized_apis.last).to be_PUT
      expect {
        client.toggle_api(api, 'PUT' => 'false')
      }.to change { client.authorized_apis.size }.by(0)
      expect(client.authorized_apis.last.reload.PUT).to be(false)
    end
  end
end
