class AddAttachmentImageToSuspectInfos < ActiveRecord::Migration
  def self.up
    change_table :suspect_infos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :suspect_infos, :image
  end
end
