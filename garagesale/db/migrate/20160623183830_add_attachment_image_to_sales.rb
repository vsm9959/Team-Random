class AddAttachmentImageToSales < ActiveRecord::Migration
  def self.up
    change_table :sales do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sales, :image
  end
end
