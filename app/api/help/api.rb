require 'grape-swagger'
require 'grape'

module Help
  class API < Grape::API
    # include Grape::Kaminari

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    version 'v1', using: :path
    format :json
    prefix :api



    class Grape::Middleware::Error
      def error_message(code, text)
        {
          error: {
            error_code: code,
            message: text
          }
        }.to_json
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      rack_response(error_message(404, 'not found'), 404)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      rack_response(error_message(20, e.message), e.status)
    end

    rescue_from :all do |e|
      if Rails.env.development?
        raise e
      else
        rack_response(error_message(500, 'internal server error'), 500)
      end
    end

    mount Help::V1::Animals
    mount Help::V1::Login

    add_swagger_documentation
  end
end
