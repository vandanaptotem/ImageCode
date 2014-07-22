class AddColumnClueInfoIdInClueTypes < ActiveRecord::Migration
  def change
    add_column :clue_types, :clue_info_id, :integer
  end
end
