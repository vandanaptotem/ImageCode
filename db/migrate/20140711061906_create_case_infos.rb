class CreateCaseInfos < ActiveRecord::Migration
  def change
    create_table :case_infos do |t|
      t.string :name
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
