class CreateClueTypes < ActiveRecord::Migration
  def change
    create_table :clue_types do |t|
      t.integer :child_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
