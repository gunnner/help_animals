class AddUserNameCloseToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :user_name_close, :string
  end
end
