class Animal < ApplicationRecord
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  validates_presence_of :breed, :sex, :color, :responsible_person
  validates_inclusion_of :complex_vaccination, :rabies_vaccination, :sterilization, :animal_has_family, in: [true, false]
end
