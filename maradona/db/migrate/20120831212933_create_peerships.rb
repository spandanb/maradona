class CreatePeerships < ActiveRecord::Migration
  def change
    create_table :peerships do |t|
      t.integer :user1
      t.integer :user2

      t.timestamps
    end
  end
end
