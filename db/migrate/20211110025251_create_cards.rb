class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.text :proceedtobuy
      t.text :addtocard

      t.timestamps
    end
  end
end
