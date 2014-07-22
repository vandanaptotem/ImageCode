class AddColumnCaseInfoIdToClueInfo < ActiveRecord::Migration
  def change
    add_column :clue_infos, :case_info_id, :integer
  end
end
