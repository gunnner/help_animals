class Help::V1::AnimalsAdmin < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::General,
          Help::Helpers::Auth,
          Help::Helpers::AnimalsParams,
          Help::Helpers::Pagination

  before do
    current_user
  end

  namespace :animals_admin do
    desc 'Return a paginated list of animals',
         is_array: true,
         http_codes: [
           { code: 200, message: 'get AnimalsAdmin', model: Help::Entities::AnimalDetails },
           { code: 422, message: 'AnimalsOutError', model: Help::Entities::APIError }
         ]

    paginate per_page: 20

    get do
      paginate animal = Animal.page(page).per(per_page)
      present animal, with: Help::Entities::AnimalDetails
    end

    desc 'Create a new animal' do
      http_codes [
        { code: 201, message: 'Animal created' },
        { code: 422, message: 'Validation Errors', model: Help::Entities::APIError }
      ]
    end

    params { use :create }
    post do
      animal = Animal.create!(declared_params)
      present animal, with: Help::Entities::AnimalImage
    end

    route_param :animal_id do
      desc 'Return a specific animal' do
        http_codes [
          { code: 422, message: 'AnimalOutError', model: Help::Entities::APIError }
        ]
      end
      get do
        animal = Animal.find(params[:animal_id])
        present animal, with: Help::Entities::AnimalDetails
      end

      desc 'Update a specific animal' do
        http_codes [
          { code: 422, message: 'Validation Errors', model: Help::Entities::APIError }
        ]
      end
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
