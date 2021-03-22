module Help::Helpers::AnimalsParams
  extend Grape::API::Helpers

  params :create do
    optional :name, type: String, desc: 'name of animal to create'
    requires :breed, type: String, allow_blank: false, desc: 'breed of an animal'
    requires :sex, type: String, allow_blank: false, desc: 'gender of an animal'
    requires :color, type: String, allow_blank: false, desc: 'color of the animal'
    optional :features, type: String, desc: 'features of the animal'
    optional :age, type: Float, desc: 'age of the animal'
    requires :complex_vaccination, coerce: Boolean, desc: 'presence of complex vaccination of the animal'
    requires :rabies_vaccination, coerce: Boolean, desc: 'presence of rabies vaccination of the animal'
    requires :sterilization, coerce: Boolean, desc: 'is the animal sterilized?'
    requires :animal_has_family, coerce: Boolean, desc: 'is the animal adopted?'
    requires :show_in_gallery, coerce: Boolean, desc: 'will a photo of the animal be displayed?'
    optional :edited_by, type: String, desc: 'who has changed an animal'
    requires :responsible_person, type: String, allow_blank: false, desc: 'the person responsible for the animal'
    optional :image_attributes, type: Hash do
      requires :file, type: File, allow_blank: false
    end
  end

  params :update do
    optional :name, type: String, desc: 'name of an animal'
    optional :breed, type: String, desc: 'breed of an animal'
    optional :sex, type: String, desc: 'gender of an animal'
    optional :color, type: String, desc: 'color of the animal'
    optional :features, type: String, desc: 'features of the animal'
    optional :age, type: Float, desc: 'age of the animal'
    optional :complex_vaccination, coerce: Boolean, desc: 'presence of complex vaccination of the animal'
    optional :rabies_vaccination, coerce: Boolean, desc: 'presence of rabies vaccination of the animal'
    optional :sterilization, coerce: Boolean, desc: 'is the animal sterilized?'
    optional :animal_has_family, coerce: Boolean, desc: 'is the animal adopted?'
    optional :responsible_person, type: String, desc: 'the person responsible for the animal'
    optional :show_in_gallery, coerce: Boolean, desc: 'will a photo of the animal be displayed?'
    optional :edited_by, type: String, desc: 'who has changed an animal'
    optional :image_attributes, type: Hash do
      requires :file, type: File, allow_blank: false
    end
  end
end
