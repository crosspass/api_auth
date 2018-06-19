class CreateApisClients < ActiveRecord::Migration[5.1]
  def change
    create_table :api_auth_apis_clients do |t|
      t.belongs_to :api
      t.belongs_to :client
    end
  end
end
