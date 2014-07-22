class AddInformationToSuspectInfo < ActiveRecord::Migration
  def change
    add_column :suspect_infos, :information, :text
  end
end
