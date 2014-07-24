class AddColumnCaseInfoIdToVictimInfo < ActiveRecord::Migration
  def change
    add_column :victim_infos, :case_info_id, :integer

  end
end
