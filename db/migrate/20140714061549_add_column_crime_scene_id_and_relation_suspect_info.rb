class AddColumnCrimeSceneIdAndRelationSuspectInfo < ActiveRecord::Migration
  def change
    add_column :suspect_infos, :crime_scene_id, :integer
  end
end
