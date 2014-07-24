class CreateVictimInfos < ActiveRecord::Migration
  def change
    create_table :victim_infos do |t|
      t.string :name
      t.text :info

      t.timestamps
    end
  end
end
