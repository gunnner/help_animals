module Help::Helpers::Errors
  def validation_error
    error!(error: { error_code: 422, message: 'validation failed' })
  end

  def not_found_error
    error!(error: { error_code: 404, message: 'not found' })
  end

  def invalid_auth_data
    error!(error: { error_code: 401, message: 'invalid authentication data' })
  end
end
