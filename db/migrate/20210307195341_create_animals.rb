class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :breed
      t.string :sex
      t.string :color
      t.string :features
      t.string :img_url
      t.float :age
      t.boolean :complex_vaccination
      t.boolean :rabies_vaccination
      t.boolean :sterilization
      t.boolean :animal_has_family
      t.string :responsible_person

      t.timestamps
    end
  end
end
