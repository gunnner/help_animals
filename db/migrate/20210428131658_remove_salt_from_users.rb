class RemoveSaltFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :salt, :string
  end

  def down
    add_column :users, :salt, :string
  end
end
