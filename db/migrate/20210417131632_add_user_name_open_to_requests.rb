class AddUserNameOpenToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :user_name_open, :string
  end
end
