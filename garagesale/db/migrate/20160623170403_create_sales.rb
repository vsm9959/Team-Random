class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :title
      t.text :description
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.datetime :posted_date
      t.integer :zip_code
      t.timestamps null: false
    end
  end
end
