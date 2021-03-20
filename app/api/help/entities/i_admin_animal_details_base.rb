class Help::Entities::IAdminAnimalDetailsBase < Grape::Entity
  expose :name
  expose :breed
  expose :sex
  expose :color
  expose :features
  expose :age
  expose :complex_vaccination, as: :complexVaccination
  expose :rabies_vaccination, as: :rabiesVaccination
  expose :sterilization
  expose :animal_has_family, as: :animalHasFamily
  expose :responsible_person
  expose :show_in_gallery, as: :showInGallery
end
