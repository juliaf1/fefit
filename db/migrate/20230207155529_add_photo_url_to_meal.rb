class AddPhotoUrlToMeal < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :photo_url, :string
  end
end
