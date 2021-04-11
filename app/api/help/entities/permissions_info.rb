class Help::Entities::PermissionsInfo < Grape::Entity
  expose :id
  expose :is_active do |instance|
    instance.active?
  end
  expose :activeadmin do |instance|
    instance.is_admin?
  end
  expose :animals_crud do |instance|
    instance.is_animal_manager?
  end
  expose :requests_crud do |instance|
    instance.is_request_manager?
  end
end
