module Help
  module V1
    class Animals < Grape::API

      helpers Help::Helpers::Animals

      namespace :animals do
        desc 'Return the list of animals'
        get do
          animal = Animal.all
          present animal, with: Help::Entities::Animal
        end

        desc 'Create a new animal'
        params do
          requires :breed, type: String
          requires :sex, type: String
          requires :color, type: String
          optional :features, type: String
          optional :age, type: Float
          requires :complex_vaccination, coerce: Boolean
          requires :rabies_vaccination, coerce: Boolean
          requires :sterilization, coerce: Boolean
          requires :animal_has_family, coerce: Boolean
          requires :responsible_person, type: String
          optional :images_attributes, type: Array do
            requires :img_url, type: String
          end
        end

        post do
          animal = Animal.create!(params)
          present animal, with: Help::Entities::Animal
        end

        route_param :animal_id do
          desc 'Return a specific animal'
          get do
            animal = Animal.find(params[:animal_id])
            present animal, with: Help::Entities::Animal
          end

          params do
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
              requires :img_url, type: String
            end
          end

          desc 'Update a specific animal'
          patch do
            animal = Animal.find(params[:animal_id])
            animal.update(declared_params)
          end

          desc 'Delete a specific animal'
          delete do
            Animal.find(params[:animal_id]).destroy
          end
        end
      end
    end
  end
end
