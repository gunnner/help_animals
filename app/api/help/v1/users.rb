class Help::V1::Users < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::General,
          Help::Helpers::Auth,
          Help::Helpers::Pagination

  before do
    current_user
  end

  namespace :users do
    desc 'Return a paginated list of users'

    paginate per_page: 20

    get do
      paginate users = User.page(page).per(per_page)
      present users, with: Help::Entities::UserDetails
    end

    route_param :user_id do
      desc 'Return a specific animal'
      get do
        user = User.find(params[:user_id])
        present user, with: Help::Entities::UserDetails
      end
    end
  end
end
