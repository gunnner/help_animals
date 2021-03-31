class Help::Entities::IAdminAnimalDetailsPostPatchRequest < Help::Entities::IAdminAnimalDetailsBase
  expose :image, expose_nil: false, using: Help::Entities::Images do |instance|
    instance.image
  end
end
