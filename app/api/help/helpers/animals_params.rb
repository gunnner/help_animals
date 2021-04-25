module Help::Helpers::AnimalsParams
  extend Grape::API::Helpers

  params :create do
    optional :name, type: String, allow_blank: false, desc: 'name of animal to create'
    requires :breed, type: String, allow_blank: false, desc: 'breed of an animal'
    requires :sex, type: String, allow_blank: false, desc: 'gender of an animal'
    requires :color, type: String, allow_blank: false, desc: 'color of the animal'
    optional :features, type: String, allow_blank: false, desc: 'features of the animal'
    optional :age, type: Float, allow_blank: false, desc: 'age of the animal'
    requires :complex_vaccination, coerce: Boolean, allow_blank: false, desc: 'presence of complex vaccination of the animal'
    requires :rabies_vaccination, coerce: Boolean, allow_blank: false, desc: 'presence of rabies vaccination of the animal'
    requires :sterilization, coerce: Boolean, allow_blank: false, desc: 'is the animal sterilized?'
    requires :animal_has_family, coerce: Boolean, allow_blank: false, desc: 'is the animal adopted?'
    requires :show_in_gallery, coerce: Boolean, allow_blank: false, desc: 'will a photo of the animal be displayed?'
    optional :edited_by, type: String, allow_blank: false, desc: 'who has changed an animal'
    requires :responsible_person, type: String, allow_blank: false, desc: 'the person responsible for the animal'
    optional :image_attributes, type: Hash do
      requires :file, type: File, allow_blank: false
    end
  end

  params :update do
    optional :name, type: String, allow_blank: false, desc: 'name of an animal'
    optional :breed, type: String, allow_blank: false, desc: 'breed of an animal'
    optional :sex, type: String, allow_blank: false, desc: 'gender of an animal'
    optional :color, type: String, allow_blank: false, desc: 'color of the animal'
    optional :features, type: String, allow_blank: false, desc: 'features of the animal'
    optional :age, type: Float, allow_blank: false, desc: 'age of the animal'
    optional :complex_vaccination, coerce: Boolean, allow_blank: false, desc: 'presence of complex vaccination of the animal'
    optional :rabies_vaccination, coerce: Boolean, allow_blank: false, desc: 'presence of rabies vaccination of the animal'
    optional :sterilization, coerce: Boolean, allow_blank: false, desc: 'is the animal sterilized?'
    optional :animal_has_family, coerce: Boolean, allow_blank: false, desc: 'is the animal adopted?'
    optional :responsible_person, type: String, allow_blank: false, desc: 'the person responsible for the animal'
    optional :show_in_gallery, coerce: Boolean, allow_blank: false, desc: 'will a photo of the animal be displayed?'
    optional :edited_by, type: String, allow_blank: false, desc: 'who has changed an animal'
    optional :image_attributes, type: Hash do
      requires :file, type: File, allow_blank: false
    end
  end

  params :sort_filter do
    optional :filter_params, type: Hash do
      optional :age, type: Array
      optional :features, type: String
      optional :complex_vaccination, type: Boolean
      optional :rabies_vaccination, type: Boolean
      optional :sterilization, type: Boolean
      optional :animal_has_family, type: Boolean
      optional :responsible_person, type: String
    end
    optional :sort_params, type: Hash do
      optional :id, type: Integer
      optional :age, type: Float
      optional :features, type: String
      optional :complex_vaccination, type: Boolean
      optional :rabies_vaccination, type: Boolean
      optional :sterilization, type: Boolean
      optional :animal_has_family, type: Boolean
      optional :responsible_person, type: String
    end
  end
end
