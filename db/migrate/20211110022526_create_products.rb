class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :price
      t.text :quanity
      t.text :details
      t.text :brand

      t.timestamps
    end
  end
end
