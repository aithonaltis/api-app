class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string "name"
      t.integer "university_id"
      t.integer "faculty_id"

      t.timestamps
    end
    add_index("departments", "university_id")
    add_index("departments", "faculty_id")
  end
end

