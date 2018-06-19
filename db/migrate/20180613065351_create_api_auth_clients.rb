class CreateApiAuthClients < ActiveRecord::Migration[5.1]
  def change
    create_table :api_auth_clients do |t|
      t.string :name
      t.string :developer
      t.string :token
      t.boolean :forbidden
      t.text :desc

      t.timestamps
    end
  end
end
