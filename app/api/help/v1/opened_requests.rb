class Help::V1::OpenedRequests < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::Auth,
          Help::Helpers::Pagination

  before do
    current_user
  end

  namespace 'opened-requests' do
    desc 'Return paginated list of opened requests'
    paginate per_page: 20

    get do
      paginate opened_request = Request.page(page).per(per_page)
      present opened_request.where(closed_date: nil).or(opened_request.where(user_closed_id: nil)), with: Help::Entities::Request
    end

    desc 'Open a new request'
    params do
      requires :address, type: String, allow_blank: false
    end

    post do
      open_request = Request.create!({
        address: params[:address],
        opened_date: DateTime.now,
        user_id: current_user.id
      })
      present open_request, with: Help::Entities::Request

    end

    route_param :request_id do
      desc 'Return a specific request'

      get do
        opened_request = Request.find(params[:request_id])
        present opened_request, with: Help::Entities::Request
      end

      desc 'Update(close) a specific request'

      patch do 
        opened_request = Request.find(params[:request_id])
        opened_request.update({
          closed_date: DateTime.now,
          user_closed_id: current_user.id
        })
      end
    end
  end
end