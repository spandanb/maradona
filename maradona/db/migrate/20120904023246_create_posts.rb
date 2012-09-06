class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.integer :reply_id
      t.string :other_users
      t.string :location

      t.timestamps
    end
  add_index :posts, [:user_id, :created_at]
  end
end
