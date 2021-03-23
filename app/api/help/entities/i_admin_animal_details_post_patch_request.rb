class Help::Entities::IAdminAnimalDetailsPostPatchRequest < Help::Entities::IAdminAnimalDetailsBase
	expose :image, using: Help::Entities::Images do |instance|
		instance.image
	end
end
