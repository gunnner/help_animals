class Help::V1::AnimalsAdmin < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::General,
          Help::Helpers::Auth,
          Help::Helpers::AnimalsParams,
          Help::Helpers::Pagination,
          Help::Helpers::Errors,
          Help::Helpers::SortFilterAnimals

  before do
    current_user
    authorize! :read, :animals
  end

  namespace :animals_admin do
    desc 'Return a paginated list of animals',
         is_array: true,
         http_codes: [
           { code: 200, message: 'get AnimalsAdmin', model: Help::Entities::AnimalDetails },
           { code: 422, message: 'AnimalsOutError', model: Help::Entities::APIError }
         ]

    paginate per_page: 20

    params { use :sort_filter }
    patch do
      filtered_animal = Animal.where(filter_params).order(sort_params)
      paginate animal = filtered_animal.page(page).per(per_page)
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
      authorize! :create, :animals
      animal = Animal.create!(declared_params)
      present animal, with: Help::Entities::UnexposeEditedBy
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
        authorize! :update, :animals
        animal = Animal.find(params[:animal_id])
        animal.update(declared_params)
        return validation_error unless animal.update(declared_params)

        animal.update(edited_by: { id: current_user.id, user_name: current_user.name }.to_json) if animal.save
      end

      desc 'Delete a specific animal'
      delete do
        authorize! :destroy, :animals
        Animal.find(params[:animal_id]).destroy
      end
    end
  end
end
