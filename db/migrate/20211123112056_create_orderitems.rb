class CreateOrderitems < ActiveRecord::Migration[6.1]
  def change
    create_table :orderitems do |t|
      t.integer :quanity
      t.integer :product_id
      t.integer :order_id
      t.decimal :total
      t.decimal :unit_price

      t.timestamps
    end
  end
end
