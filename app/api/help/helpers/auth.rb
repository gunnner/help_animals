module Help::Helpers::Auth

  def current_user
    return @current_user if @current_user

    token = headers['Authorization'].split.last
    user = user(token)
    error!('user not found') unless user

    @current_user = user
  end

  private

  def user(token)
    user_data, = JWT.decode token, Help::V1::Login::HMAC_SECRET, true, { algorithm: 'HS256' }
    User.find_by(id: user_data['user_id'])

  rescue JWT::DecodeError
    error!('invalid token')
  end
end