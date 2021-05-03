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

  def pasword_length_error
    error!(error: { error_code: 422, message: 'password must be at least eight characters long' })
  end

  def empty_email
    error!(error: { error_code: 404, message: "email can't be empty" })
  end

  def no_such_email
    error!(error: { error_code: 404, message: 'no such email' })
  end

  def invalid_token
    error!(error: { error_code: 401, message: 'invalid token' })
  end
end
