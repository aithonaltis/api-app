class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string "name"
      t.integer "university_id"

      t.timestamps
    end
    add_index("faculties", "university_id")
  end
end
