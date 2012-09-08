class CreateUsersGroups < ActiveRecord::Migration
  def up
	 	create_table :users_groups, :id => false do |t|
			t.references :user
			t.references :group
		end

  end

  def down
  	drop_table :users_groups
  end
end
