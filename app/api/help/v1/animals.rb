class Help::V1::Animals < Grape::API

  helpers Help::Helpers::General,
          Help::Helpers::AnimalsParams

  namespace :animals do
    desc 'Return the list of animals'
    get do
      animal = Animal.all
      present animal, with: Help::Entities::Animals
    end

    desc 'Create a new animal'
    params { use :create }
    post do
      animal = Animal.create!(declared_params)
      present animal, with: Help::Entities::Animals
    end

    route_param :animal_id do
      desc 'Return a specific animal'
      get do
        animal = Animal.find(params[:animal_id])
        present animal, with: Help::Entities::Animals
      end

      desc 'Update a specific animal'
      params { use :update }
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
