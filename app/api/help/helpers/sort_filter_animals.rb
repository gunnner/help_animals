module Help::Helpers::SortFilterAnimals
  def filter_params
    return {} unless params[:filter]

    params[:filter][:age] = Range.new(*params.dig(:filter, :age)) if params.dig(:filter).key?(:age)
    params[:filter]
  end

  def sort_params
    params[:order] || {}
  end
end
