class CreateFavoriteGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_genres do |t|
      t.integer :user_id, index: true
      t.integer :genre_id, index: true     

      t.timestamps
    end
  end
end
