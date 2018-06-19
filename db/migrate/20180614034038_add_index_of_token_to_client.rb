class AddIndexOfTokenToClient < ActiveRecord::Migration[5.1]
  def change
    add_index :api_auth_clients, :token, unique: true
  end
end
