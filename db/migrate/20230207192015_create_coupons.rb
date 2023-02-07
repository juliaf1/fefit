class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :total_uses
      t.integer :total_used
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
