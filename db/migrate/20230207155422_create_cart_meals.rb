class CreateCartMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_meals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.integer :units, null: false, default: 1

      t.timestamps
    end
  end
end
