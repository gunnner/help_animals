class Help::V1::Reset < Grape::API

  helpers Help::Helpers::Errors

  namespace :reset do

    params do
      requires :token, type: String, allow_blank: false
      requires :password, type: String, allow_blank: false
    end

    post do
      user = User.find_by(reset_password_token: params[:token].to_s)

      if user.present? && user.password_token_valid?
        return pasword_length_error if params[:password].to_s.length < 8

        user.reset_password!(params[:password])
        { message: 'successfully' }
      else
        validation_error
      end
    end
  end
end
