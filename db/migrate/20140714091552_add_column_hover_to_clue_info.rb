class AddColumnHoverToClueInfo < ActiveRecord::Migration
  def change
    add_column :clue_infos, :hover, :text
  end
end
