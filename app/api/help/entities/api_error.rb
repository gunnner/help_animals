class Help::Entities::APIError < Grape::Entity
	 expose :error_code, documentation: { type: Integer, desc: 'status code' }
   expose :message, documentation: { type: String, desc: 'error message' }
end