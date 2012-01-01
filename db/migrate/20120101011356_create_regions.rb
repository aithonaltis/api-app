class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string "name"
      t.integer "district_id"

      t.timestamps
    end
    add_index("regions", "district_id")
  end
end
