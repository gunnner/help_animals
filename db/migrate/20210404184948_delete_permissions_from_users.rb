class DeletePermissionsFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :permissions
  end

  def down
    add_column :users, :permissions, :integer
  end
end
