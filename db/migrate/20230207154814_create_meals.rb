class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :veggie, null: false, default: false
      t.boolean :vegan, null: false, default: false
      t.boolean :hot, null: false, default: false
      t.integer :units, null: false, default: 0

      t.timestamps
    end
  end
end
