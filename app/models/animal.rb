class Animal < ApplicationRecord
  resourcify
  nilify_blanks
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  validates :age, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 20 }
  validates_presence_of :breed, :sex, :color, :responsible_person, :age
  validates_inclusion_of :complex_vaccination, :rabies_vaccination, :sterilization, :animal_has_family, :show_in_gallery, in: [true, false]
end
