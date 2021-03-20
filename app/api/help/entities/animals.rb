class Help::Entities::Animals < Grape::Entity
  expose :id
  expose :breed
  expose :sex
  expose :color
  expose :features
  expose :age
  expose :complex_vaccination
  expose :rabies_vaccination
  expose :sterilization
  expose :animal_has_family
  expose :responsible_person
  expose :image, using: Help::Entities::Images do |instance|
    instance.image
  end
end
