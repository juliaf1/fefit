class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.boolean :express, null: false, default: false
      t.date :date
      t.float :total_price
      t.references :coupon, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
