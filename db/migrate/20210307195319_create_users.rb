class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :phone1
      t.string :phone2
      t.string :email
      t.integer :permissions
      t.string :password

      t.timestamps
    end
  end
end
