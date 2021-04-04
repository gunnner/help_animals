module Help::Helpers::Pagination
  def page
    page ||= params[:page] || 1
  end

  def per_page
    per_page ||= params[:per_page] || 20
  end
end
