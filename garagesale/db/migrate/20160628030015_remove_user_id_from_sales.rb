class RemoveUserIdFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :user_id, :integer
  end
end
