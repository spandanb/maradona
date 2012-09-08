class CreatePeerRequests < ActiveRecord::Migration
  def change
    create_table :peer_requests do |t|
      t.integer :from
      t.integer :to
      t.boolean :replied

      t.timestamps
    end
  end
end
