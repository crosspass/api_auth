class CreateApiAuthClients < ActiveRecord::Migration[5.1]
  def change
    create_table :api_auth_clients do |t|
      t.string :name
      t.string :email
      t.text :desc
      t.string :token

      t.timestamps
    end

    create_table :api_auth_authorized_apis do |t|
      t.integer :api_id
      t.integer :client_id
      t.boolean :GET, default: false
      t.boolean :POST, default: false
      t.boolean :PUT, default: false
      t.boolean :DELETE, default: false
    end
  end
end
