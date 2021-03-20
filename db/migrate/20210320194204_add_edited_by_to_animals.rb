class AddEditedByToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :edited_by, :string
  end
end
