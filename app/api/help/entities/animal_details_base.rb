class Help::Entities::AnimalDetailsBase < Grape::Entity
  expose :name, documentation: { type: String, desc: 'name of the animal' }
  expose :breed, documentation: { type: String, desc: 'breed of the animal' }
  expose :sex, documentation: { type: String, desc: 'gender of the animal' }
  expose :color, documentation: { type: String, desc: 'color of the animal' }
  expose :features, documentation: { type: String, desc: 'features of the animal' }
  expose :age, documentation: { type: Float, desc: 'age of the animal' }
  expose :complex_vaccination, documentation: { type: 'boolean', desc: 'presence of complex vaccination of the animal' }
  expose :rabies_vaccination, documentation: { type: 'boolean', desc: 'presence of rabies vaccination of the animal' }
  expose :sterilization, documentation: { type: 'boolean', desc: 'is the animal sterilized?' }
  expose :animal_has_family, documentation: { type: 'boolean', desc: 'is the animal adopted?' }
  expose :responsible_person, documentation: { type: String, desc: 'the person responsible for the animal' }
  expose :show_in_gallery, documentation: { type: 'boolean', desc: 'will a photo of the animal be displayed?' }
end
