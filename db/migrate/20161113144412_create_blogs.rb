class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.boolean :delete_flag

      t.timestamps null: false
    end
  end
end
