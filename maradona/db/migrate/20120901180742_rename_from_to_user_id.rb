class RenameFromToUserId < ActiveRecord::Migration
  def up
  	rename_column :peer_requests, :from, :user_id 
  end

  def down
  	rename_column :peer_requests, :user_id, :from
  end
end
