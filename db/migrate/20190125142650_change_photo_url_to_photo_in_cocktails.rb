class ChangePhotoUrlToPhotoInCocktails < ActiveRecord::Migration[5.2]
  def change
    rename_column :cocktails, :photo_url, :photo
  end
end
