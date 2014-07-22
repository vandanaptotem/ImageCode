class AddAttachmentImageToClueInfos < ActiveRecord::Migration
  def self.up
    change_table :clue_infos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :clue_infos, :image
  end
end
