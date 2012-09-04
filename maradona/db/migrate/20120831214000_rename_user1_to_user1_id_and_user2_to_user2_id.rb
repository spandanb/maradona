class RenameUser1ToUser1IdAndUser2ToUser2Id < ActiveRecord::Migration
  def up
  	rename_column :peerships, :user1, :user1_id
  	rename_column :peerships, :user2, :user2_id
  end

  def down
  	rename_column :peerships, :user1_id, :user1
  	rename_column :peerships, :user2_id, :user2
  end
end
