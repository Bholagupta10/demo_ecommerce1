class CreateBuyers < ActiveRecord::Migration[6.1]
  def change
    create_table :buyers do |t|
      t.string :name
      t.text :address
      t.text :mobile
      t.text :paymentmethod
      t.text :addnote

      t.timestamps
    end
  end
end
