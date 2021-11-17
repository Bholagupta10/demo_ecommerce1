class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :quanity
      t.string  :details
      t.string :brand

      t.timestamps
      t.references :user
    end
  end
end
