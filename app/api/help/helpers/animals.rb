module Help::Helpers::Animals
  def declared_params
    declared(params, include_missing: false)
  end
end
