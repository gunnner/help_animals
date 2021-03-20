class AddShowInGalleryToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :show_in_gallery, :boolean
  end
end
