module Help::Helpers::AnimalsParams
  extend Grape::API::Helpers

  params :create do
    optional :name, type: String, desc: 'Name of animal to create'
    requires :breed, type: String, allow_blank: false, desc: 'Breed of an animal'
    requires :sex, type: String, allow_blank: false
    requires :color, type: String, allow_blank: false
    optional :features, type: String
    optional :age, type: Float
    requires :complex_vaccination, coerce: Boolean
    requires :rabies_vaccination, coerce: Boolean
    requires :sterilization, coerce: Boolean
    requires :animal_has_family, coerce: Boolean
    requires :show_in_gallery, coerce: Boolean
    optional :edited_by, type: String
    requires :responsible_person, type: String, allow_blank: false
    optional :image_attributes, type: Hash do
      requires :file, type: File, allow_blank: false
    end
  end

  params :update do
    optional :name, type: String, desc: 'Name of an animal'
    optional :breed, type: String
    optional :sex, type: String
    optional :color, type: String
    optional :features, type: String
    optional :age, type: Float
    optional :complex_vaccination, coerce: Boolean
    optional :rabies_vaccination, coerce: Boolean
    optional :sterilization, coerce: Boolean
    optional :animal_has_family, coerce: Boolean
    optional :responsible_person, type: String
    optional :show_in_gallery, coerce: Boolean
    optional :edited_by, type: String
    optional :image_attributes, type: Hash do
      requires :file, type: File, allow_blank: false
    end
  end
end
