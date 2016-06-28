class AddUserAuthTokenToSales < ActiveRecord::Migration
  def change
    add_column :sales, :user_auth_token, :string
  end
end
