class Help::Entities::IAdminAnimalDetailsGetResponse < Help::Entities::IAdminAnimalDetailsBase
  expose :id
  expose :created_at, as: :dateAdded
  expose :updated_at, as: :dateLastEdit
  expose :edited_by, as: :editedBy
end
