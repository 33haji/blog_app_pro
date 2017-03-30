class AddBlogIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :blog_id, :integer, null: false, default: 0
  end
end
