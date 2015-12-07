class CreateWindows < ActiveRecord::Migration
  def change
    create_table :windows do |t|
      t.string :store_name
      t.string :location

      t.timestamps null: false
    end
  end
end
