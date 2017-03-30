class AddImageToTipGenre < ActiveRecord::Migration
  def change
    add_column :tip_genres, :image, :string
  end
end
