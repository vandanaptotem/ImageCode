class CreateCommentData < ActiveRecord::Migration
  def change
    create_table :comment_data do |t|
      t.integer :user_id
      t.text :comments
      t.integer :case_id
      t.integer :suspect_id

      t.timestamps
    end
  end
end
