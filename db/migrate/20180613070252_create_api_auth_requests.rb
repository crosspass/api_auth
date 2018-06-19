class CreateApiAuthRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :api_auth_requests do |t|
      t.integer :api_id
      t.integer :client_id
      t.integer :amount
      t.date :date
    end
    add_index :api_auth_apis, :date
  end
end
