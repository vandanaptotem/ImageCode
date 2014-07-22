class AddColCaseIdToCrimeScene < ActiveRecord::Migration
  def change
    add_column :crime_scenes, :case_info_id, :integer
  end
end
