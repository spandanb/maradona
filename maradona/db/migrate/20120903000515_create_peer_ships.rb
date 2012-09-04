class CreatePeerShips < ActiveRecord::Migration
  def change
    create_table :peer_ships do |t|
      t.integer :user_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
