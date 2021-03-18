class AnimalsForbidNullOnBoolean < ActiveRecord::Migration[6.1]
  def change
    change_column_null :animals, :complex_vaccination, false, false
    change_column_null :animals, :rabies_vaccination, false, false
    change_column_null :animals, :sterilization, false, false
    change_column_null :animals, :animal_has_family, false, false
  end
end
