class Help::Entities::AnimalDetails < Help::Entities::AnimalDetailsBase
  expose :id, documentation: { type: String, desc: 'identity of a resource' }
  expose :image, using: Help::Entities::Images do |instance|
    instance.image
  end
  expose :created_at, documentation: { type: String, desc: 'date of created' }
  expose :updated_at, documentation: { type: String, desc: 'date of last editing' }
  expose :edited_by, documentation: { type: String, desc: 'who has changed an animal' }
end
