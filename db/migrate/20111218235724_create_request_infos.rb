class CreateRequestInfos < ActiveRecord::Migration
  def change
    create_table :request_infos do |t|
      t.string "ip"
      t.string "url"
      t.string "params" #params
      t.timestamps
    end
  end
end
