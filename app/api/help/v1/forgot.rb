class Help::V1::Forgot < Grape::API

  helpers Help::Helpers::Errors

  namespace :forgot do
    desc 'forgot password'

    post do
      error!(error: { error_code: 404, message: 'email not present' }) if params[:email].blank?

      user = User.find_by(email: params[:email])
      if user.present?
        user.generate_password_token!
        UserMailer.password_reset(user).deliver_now
      else
        error!(error: { error_code: 404, message: 'no such email' })
      end
    end
  end
end
