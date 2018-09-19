class AddStatusToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :api_auth_clients, :status, :integer, default: 0
  end
end
