class AddColumnMediaToCaseInfos < ActiveRecord::Migration
  def self.up
    change_table :case_infos do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :case_infos, :media
  end
end
