module Help
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    mount Help::V1::Animals
    mount Help::V1::Login
  end
end
