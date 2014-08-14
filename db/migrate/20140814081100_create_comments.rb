class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :comments
      t.integer :case_id

      t.timestamps
    end
  end
end
