class AddColCrimeSceneInfoIdToClueInfo < ActiveRecord::Migration
  def change
    add_column :clue_infos, :crime_scene_id, :integer
  end
end
