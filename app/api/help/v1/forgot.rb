class Help::V1::Forgot < Grape::API

  helpers Help::Helpers::Errors

  namespace :forgot do
    desc 'forgot password'

    params do
      requires :email, type: String, allow_blank: false
    end

    post do
      empty_email if params[:email].blank?

      user = User.find_by(email: params[:email])
      no_such_email unless user

      if user.present?
        user.generate_password_token!
        UserMailer.password_reset(user).deliver_now
        { message: 'successfully' }
      end
    end
  end
end
