class AddGroupidToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :group_id, :int
  end
end
