class Help::Entities::IAdminAnimalDetailsGetResponse < Help::Entities::IAdminAnimalDetailsBase
  expose :id, documentation: { type: String, desc: 'identity of a resource' }
  expose :image
  expose :created_at, as: :dateAdded, documentation: { type: String, desc: 'date of created' }
  expose :updated_at, as: :dateLastEdit, documentation: { type: String, desc: 'date of last editing' }
  expose :edited_by, as: :editedBy, documentation: { type: String, desc: 'who has changed an animal' }
end
