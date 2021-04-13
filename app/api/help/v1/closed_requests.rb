class Help::V1::ClosedRequests < Grape::API
  include Grape::Kaminari

  helpers Help::Helpers::Auth,
          Help::Helpers::Pagination

  before do
    current_user
    authorize! :read, :closed_requests
  end

  namespace 'closed-requests' do
    desc 'Return paginated list of closed requests'
    paginate per_page: 20

    get do
      all_requests = Request.all
      filtered_requests = all_requests.where.not(closed_date: nil).or(all_requests.where.not(user_closed_id: nil))
      paginate closed_requests = filtered_requests.page(page).per(per_page)
      present closed_requests, with: Help::Entities::Request
    end

    desc 'Open a new request'
    params do
      requires :address, type: String, allow_blank: false
    end

    post do
      authorize! :create, :closed_requests
      open_request = Request.create!({
                                       address: params[:address],
                                       opened_date: DateTime.now,
                                       user_id: current_user.id
                                     })
      present open_request, with: Help::Entities::Request
    end

    route_param :request_id do
      desc 'Return a specific closed request'

      get do
        closed_request = Request.find(params[:request_id])
        if closed_request.closed_date.present? || closed_request.user_closed_id.present?
          present closed_request, with: Help::Entities::Request
        else
          error!(error: { error_code: 404, message: 'not found' })
        end
      end

      desc 'Delete a specific request'
      delete do
        authorize! :destroy, :closed_requests
        delete_request = Request.find(params[:request_id])
        if delete_request.closed_date.present? || delete_request.user_closed_id.present?
          delete_request.destroy
        else
          error!(error: { error_code: 404, message: 'not found' })
        end
      end
    end
  end
end
