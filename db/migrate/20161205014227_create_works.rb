class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :required_time, null: false, default: 0

      t.timestamps null: false
    end
  end
end
