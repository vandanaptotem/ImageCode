class ClueData < ActiveRecord::Migration
  def change
  end
  def self.up
    add_attachment :clue_data, :image
  end

  def self.down
    remove_attachment :clue_data, :image
  end
end
