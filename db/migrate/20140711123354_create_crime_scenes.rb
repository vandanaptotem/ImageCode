class CreateCrimeScenes < ActiveRecord::Migration
  def change
    create_table :crime_scenes do |t|
      t.text :comments

      t.timestamps
    end
  end
end
