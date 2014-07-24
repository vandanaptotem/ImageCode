class CreateClueInfos < ActiveRecord::Migration
  def change
    create_table :clue_infos do |t|

      t.timestamps
    end
  end
end
