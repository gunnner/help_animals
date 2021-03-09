module Help
  module V1
    class Login < Grape::API
      namespace :login do
        desc 'Log in'
        params do
          requires :email, type: String
          requires :password, type: String
        end

        post do
          user = User.authenticate(params[:email], params[:password])

          payload = { user_id: user.id }
          token = JWT.encode payload, nil, 'none'

          {token: token}
        end

        desc 'Check login'
        params do
          requires :token, type: String
        end
        get do
          user_data, = JWT.decode params[:token], nil, false
          user = User.find(user_data['user_id'])
          user
        end

      end
    end
  end
end
