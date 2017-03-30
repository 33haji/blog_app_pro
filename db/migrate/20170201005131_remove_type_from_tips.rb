class RemoveTypeFromTips < ActiveRecord::Migration
  def up
    remove_column :tips, :type
  end
  
  def down
    add_column :tips, :type, :string
  end
end
