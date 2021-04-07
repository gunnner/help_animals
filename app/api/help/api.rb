require 'grape-swagger'

module Help
  class API < Grape::API
    extend ActiveSupport::Concern

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
      header['Access-Control-Expose-Headers'] = '*'
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
      rack_response(error_message(404, e.message), 404)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      rack_response(error_message(400, e.message), e.status)
    end

    included do
      rescue_from CanCan::AccessDenied do
        rack_response(error_message(403, 'access denied'), 403)
      end
    end

    rescue_from JWT::DecodeError do
      rack_response(error_message(401, 'invalid token'), 401)
    end

    rescue_from :all do |e|
      if Rails.env.development?
        raise e
      else
        rack_response(error_message(500, 'internal server error'), 500)
      end
    end

    mount Help::V1::AnimalsAdmin
    mount Help::V1::Login
    mount Help::V1::Users
    mount Help::V1::Animals

    add_swagger_documentation schemes:
                                - 'http'
  end
end
