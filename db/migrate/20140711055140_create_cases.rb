class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
