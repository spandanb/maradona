class DropPeerRequests < ActiveRecord::Migration
  def up
  	drop_table :peer_requests
  end

  def down
  end
end
