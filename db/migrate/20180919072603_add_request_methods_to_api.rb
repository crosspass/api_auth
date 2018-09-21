class AddRequestMethodsToApi < ActiveRecord::Migration[5.1]
  def change
    add_column :api_auth_apis, :GET, :boolean, default: false
    add_column :api_auth_apis, :POST, :boolean, default: false
    add_column :api_auth_apis, :PUT, :boolean, default: false
    add_column :api_auth_apis, :DELETE, :boolean, default: false
  end
end
