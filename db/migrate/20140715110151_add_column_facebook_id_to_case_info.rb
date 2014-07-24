class AddColumnFacebookIdToCaseInfo < ActiveRecord::Migration
  def change
    add_column :case_infos, :facebook_id, :integer
  end
end
