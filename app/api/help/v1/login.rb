class Help::V1::Login < Grape::API
  HMAC_SECRET = ENV.fetch('JWT_SECRET').freeze

  helpers Help::Helpers::General,
          Help::Helpers::Auth,
          Help::Helpers::Errors

  namespace :login do
    desc 'Log in'
    params do
      optional :email, type: String, allow_blank: false, regexp: User::VALID_EMAIL
      optional :login, type: String, allow_blank: false
      requires :password, type: String

      at_least_one_of :email, :login
    end

    post do
      user = User.find_by(email: params[:email])
      invalid_auth_data unless user

      if user && user.authenticate(params[:password])

        iat = Time.now.to_i
        exp = 24.hours.from_now.to_i

        exp_payload = { user_id: user.id, iat: iat, exp: exp }
        token = JWT.encode exp_payload, HMAC_SECRET, 'HS256'

        { token: token }
      else
        invalid_auth_data
      end
    end

    desc 'Check login'
    get do
      present current_user, with: Help::Entities::PermissionsInfo
    end
  end
end
