class RemoveAuthTokenFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :auth_token, :string
  end
end
