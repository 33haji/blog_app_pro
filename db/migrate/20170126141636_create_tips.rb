class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.text :title
      t.text :detail
      t.string :type
      t.boolean :delete_flag
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
