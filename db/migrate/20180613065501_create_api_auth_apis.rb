class CreateApiAuthApis < ActiveRecord::Migration[5.1]
  def change
    create_table :api_auth_apis do |t|
      t.string :path
    end
  end
end
