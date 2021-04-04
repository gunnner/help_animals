class DeleteImgUrlFromAnimals < ActiveRecord::Migration[6.1]
  def up
    remove_column :animals, :img_url
  end

  def down
    add_column :animals, :img_url, :string
  end
end
