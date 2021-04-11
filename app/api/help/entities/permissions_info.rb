class Help::Entities::PermissionsInfo < Grape::Entity

  def current_ability(instance)
    @current_ability ||= ::Ability.new(instance)
  end

  expose :id
  expose :is_active do |instance|
    instance.active?
  end
  expose :activeadmin do |instance|
    instance.is_admin?
  end
  expose :animals_crud do |instance|
    current_ability(instance).can? :crud, :animals
  end
  expose :requests_crud do |instance|
    current_ability(instance).can?(:crud, :closed_requests && :open_requests)
  end
end
