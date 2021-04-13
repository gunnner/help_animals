module Help::Helpers::Auth
  def current_user
    return @current_user if @current_user

    token = headers['Authorization']
    if token.present?
      token = token.split.last
      user = user(token)
      error!('user not found') unless user
      @current_user = user
    else
      error!(error: { error_code: 400, message: 'token is missing' })
    end
  end

  private

  def user(token)
    user_data, = JWT.decode token, Help::V1::Login::HMAC_SECRET, true, { algorithm: 'HS256' }
    User.find_by(id: user_data['user_id'])
  end
end
