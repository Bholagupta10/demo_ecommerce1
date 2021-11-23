class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quanity
      t.decimal :total

      t.timestamps
      t.references :cart
      t.references :product
      end
  end
end
