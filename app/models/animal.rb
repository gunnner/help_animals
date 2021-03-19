class Animal < ApplicationRecord
  validates_presence_of :breed, :sex, :color, :responsible_person
  validates_inclusion_of :complex_vaccination, :rabies_vaccination, :sterilization, :animal_has_family, in: [true, false]
end
