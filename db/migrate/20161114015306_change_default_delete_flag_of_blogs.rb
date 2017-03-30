class ChangeDefaultDeleteFlagOfBlogs < ActiveRecord::Migration
  def change
    change_column :blogs, :delete_flag, :boolean, default: false
  end
end
