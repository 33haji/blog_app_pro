class CreateTipGenres < ActiveRecord::Migration
  def change
    create_table :tip_genres do |t|
      t.string :name
      
      t.timestamps null: false
    end
  end
end
