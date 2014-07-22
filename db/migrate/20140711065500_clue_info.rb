class ClueInfo < ActiveRecord::Migration
  def change
  end
  def self.up
    add_attachment :clue_infos, :image
  end

  def self.down
    remove_attachment :clue_infos, :image
  end
end
