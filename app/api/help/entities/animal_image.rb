class Help::Entities::AnimalImage < Help::Entities::AnimalDetailsBase
  expose :image, using: Help::Entities::Images do |instance|
    instance.image
  end
end
