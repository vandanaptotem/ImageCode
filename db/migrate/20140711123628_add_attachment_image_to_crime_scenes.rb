class AddAttachmentImageToCrimeScenes < ActiveRecord::Migration
  def self.up
    change_table :crime_scenes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :crime_scenes, :image
  end
end
