class AddCordXAndCordYAndCordZAndInfoToVictimInfo < ActiveRecord::Migration
  def change
    add_column :clue_infos, :cord_x, :integer
    add_column :clue_infos, :cord_y, :integer
    add_column :clue_infos, :cord_z, :integer
    add_column :clue_infos, :info, :string
  end
end
