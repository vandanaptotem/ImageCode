class AddCaseInfoIdAndRelationToSuspectInfo < ActiveRecord::Migration
  def change
    add_column :suspect_infos, :case_info_id, :integer
    add_column :suspect_infos, :relation, :string
  end
end
