class CreateItemResponses < ActiveRecord::Migration
  def change
    create_table :item_responses do |t|
      t.integer :item_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
