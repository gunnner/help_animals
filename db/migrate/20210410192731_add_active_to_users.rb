class AddActiveToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active, :boolean
  end
end
