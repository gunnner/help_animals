class Help::V1::Reset < Grape::API

  helpers Help::Helpers::Errors

  namespace :reset do
    post do
      token = params[:token].to_s
      user = User.find_by(reset_password_token: token)

      if user.present? && user.password_token_valid?
        return pasword_length_error if params[:password].to_s.length < 8

        user.reset_password!(params[:password])
      else
        validation_error
      end
    end
  end
end
