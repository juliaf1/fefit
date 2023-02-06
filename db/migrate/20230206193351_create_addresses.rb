class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :complement
      t.string :reference
      t.string :zipcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
