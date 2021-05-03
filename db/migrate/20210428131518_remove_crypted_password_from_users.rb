class RemoveCryptedPasswordFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :crypted_password, :string
  end

  def down
    add_column :users, :crypted_password, :string
  end
end
