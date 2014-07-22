class AddAttachmentImageToVictimInfos < ActiveRecord::Migration
  def self.up
    change_table :victim_infos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :victim_infos, :image
  end
end
