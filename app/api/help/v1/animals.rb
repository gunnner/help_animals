class Help::V1::Animals < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::Pagination

  namespace :animals do
    desc 'Return a paginated list of animals'

    paginate per_page: 20

    get do
      paginate animal = Animal.page(page).per(per_page)
      present animal, with: Help::Entities::AnimalDetails
    end

    route_param :animal_id do
      desc 'Return a specific animal'
      get do
        animal = Animal.find(params[:animal_id])
        present animal, with: Help::Entities::AnimalDetails
      end
    end
  end
end
