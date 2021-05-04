class Help::V1::Login < Grape::API
  HMAC_SECRET = ENV.fetch('JWT_SECRET').freeze

  helpers Help::Helpers::Auth,
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
      email = params[:email].downcase if params[:email].present?
      login = params[:login].downcase if params[:login].present?

      user = User.find_by(email: email)&.authenticate(params[:password]) ||
             User.find_by(login: login)&.authenticate(params[:password])

      invalid_auth_data unless user

      user.auth_token = SecureRandom.base64

      if user
        cookies[:auth_token] = { value: user.auth_token, expires: 4.weeks.from_now } if params[:remember_me]
        cookies[:auth_token] = user.auth_token unless params[:remember_me]

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

    desc 'Destroy session'
    delete do
      cookies.delete(:auth_token)
    end
  end
end
