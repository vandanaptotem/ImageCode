class AddColumnCordWToClueInfo < ActiveRecord::Migration
  def change
    add_column :clue_infos, :cord_w, :integer
  end
end
