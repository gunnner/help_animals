module Help::Helpers::AnimalsParams
  extend Grape::API::Helpers

  params :create do
    requires :breed, type: String, allow_blank: false
    requires :sex, type: String, allow_blank: false
    requires :color, type: String, allow_blank: false
    optional :features, type: String
    optional :age, type: Float
    requires :complex_vaccination, coerce: Boolean
    requires :rabies_vaccination, coerce: Boolean
    requires :sterilization, coerce: Boolean
    requires :animal_has_family, coerce: Boolean
    requires :responsible_person, type: String, allow_blank: false
    optional :images_attributes, type: Array do
      requires :img_url, type: String, allow_blank: false
    end
  end

  params :update do
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
    optional :images_attributes, type: Array do
      requires :img_url, type: String, allow_blank: false
    end
  end
end
