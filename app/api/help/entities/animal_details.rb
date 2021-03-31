class Help::Entities::AnimalDetails < Help::Entities::AnimalDetailsBase
  with_options(expose_nil: false) do
    expose :id, documentation: { type: String, desc: 'identity of a resource' }
    expose :image, using: Help::Entities::Images do |instance|
      instance.image
    end
    expose :created_at, as: :dateAdded, documentation: { type: String, desc: 'date of created' }
    expose :updated_at, as: :dateLastEdit, documentation: { type: String, desc: 'date of last editing' }
    expose :edited_by, as: :editedBy, expose_nil: false, documentation: { type: String, desc: 'who has changed an animal' }
  end
end
