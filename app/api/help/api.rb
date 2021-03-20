module Help
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    class Grape::Middleware::Error
      def error_message(text)
        {
          :error => {
            :message => text
          }
        }.to_json
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      rack_response(error_message('not found'), 404)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      rack_response(error_message(e.message), e.status)
    end

    rescue_from :all do |e|
      if Rails.env.development?
        raise e
      else
        rack_response(error_message('internal server error'), 500)
      end
    end

    mount Help::V1::Animals
    mount Help::V1::Login
  end
end
