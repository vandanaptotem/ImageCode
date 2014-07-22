class CreateSuspectInfos < ActiveRecord::Migration
  def change
    create_table :suspect_infos do |t|
      t.string :name
      t.text :interrogate

      t.timestamps
    end
  end
end
