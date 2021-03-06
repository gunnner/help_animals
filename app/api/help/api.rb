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

    rescue_from ActiveRecord::RecordNotFound do
      rack_response(error_message(404, 'not found'), 404)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      rack_response(error_message(400, e.message), e.status)
    end

    rescue_from CanCan::AccessDenied do
      rack_response(error_message(403, 'access denied'), 403)
    end

    rescue_from JWT::DecodeError do
      rack_response(error_message(401, 'invalid token'), 401)
    end

    rescue_from Grape::Exceptions::MethodNotAllowed do
      rack_response(error_message(405, 'not allowed'), 405)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      rack_response(error_message(422, e.message), 422)
    end

    rescue_from :all do |e|
      rack_response(error_message(500, e.message), 500)
    end

    mount Help::V1::AnimalsAdmin
    mount Help::V1::Login
    mount Help::V1::Users
    mount Help::V1::Animals
    mount Help::V1::OpenedRequests
    mount Help::V1::ClosedRequests
    mount Help::V1::Forgot
    mount Help::V1::Reset

    add_swagger_documentation schemes:
                                - 'http'
  end
end
