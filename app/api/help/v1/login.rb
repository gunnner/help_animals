class Help::V1::Login < Grape::API
  HMAC_SECRET = ENV.fetch('JWT_SECRET').freeze

  namespace :login do
    desc 'Log in'
    params do
      requires :email, type: String
      requires :password, type: String
    end

    post do
      user = User.authenticate(params[:email], params[:password])
      iat = Time.now.to_i
      exp = Time.now.to_i + 4 * 3600

      exp_payload = { user_id: user.id, iat: iat, exp: exp }
      token = JWT.encode exp_payload, HMAC_SECRET, 'HS256'

      { token: token }
    end

    desc 'Check login'
    params do
      requires :token, type: String
    end
    get do
      user_data, = JWT.decode params[:token], HMAC_SECRET, true, { algorithm: 'HS256' }
      user = User.find(user_data['user_id'])
      user
    end
  end
end
