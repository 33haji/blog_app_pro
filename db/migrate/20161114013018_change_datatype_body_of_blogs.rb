class ChangeDatatypeBodyOfBlogs < ActiveRecord::Migration
  def change
    change_column :blogs, :body, :text
    change_column :blogs, :title, :text
  end
end
