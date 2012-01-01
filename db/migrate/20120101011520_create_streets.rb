class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string "name"
      t.integer "region_id"

      t.timestamps
    end
    add_index("streets", "region_id")
  end
end
