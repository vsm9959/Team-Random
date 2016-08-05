class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :sale, foreign_key: true
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
