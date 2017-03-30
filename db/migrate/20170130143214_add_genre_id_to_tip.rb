class AddGenreIdToTip < ActiveRecord::Migration
  def change
    add_column :tips, :genre_id, :integer, null: false, default: 0, foreign_key: true
  end
end
