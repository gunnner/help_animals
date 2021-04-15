class Help::V1::OpenedRequests < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::Auth,
          Help::Helpers::Pagination,
          Help::Helpers::Errors

  before do
    current_user
    authorize! :read, :opened_requests
  end

  namespace 'opened-requests' do
    desc 'Return paginated list of opened requests'
    paginate per_page: 20

    get do
      all_requests = Request.all
      filtered_requests = all_requests.where(closed_date: nil).or(all_requests.where(user_closed_id: nil))
      paginate opened_requests = filtered_requests.page(page).per(per_page)
      present opened_requests, with: Help::Entities::Request
    end

    desc 'Open a new request'
    params do
      requires :address, type: String, allow_blank: false
    end

    post do
      authorize! :create, :opened_requests
      open_request = Request.create!({
                                       address: params[:address],
                                       opened_date: DateTime.now,
                                       user_id: current_user.id
                                     })
      present open_request, with: Help::Entities::Request
    end

    route_param :request_id do
      desc 'Return a specific opened request'

      get do
        opened_request = Request.find(params[:request_id])
        return not_found_error if opened_request.closed_date || opened_request.user_closed_id

        present opened_request, with: Help::Entities::Request
      end

      desc 'Update(close) a specific request'

      patch do
        authorize! :update, :opened_requests
        opened_request = Request.find(params[:request_id])
        return not_found_error unless opened_request.closed_date.nil? || opened_request.user_closed_id.nil?

        opened_request.update({
                                closed_date: DateTime.now,
                                user_closed_id: current_user.id
                              })
      end
    end
  end
end
