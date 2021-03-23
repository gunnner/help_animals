class AddNameToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :name, :string
  end
end
