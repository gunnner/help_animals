class Help::Entities::UserDetails < Grape::Entity
  expose :id
  expose :login
  expose :name
  expose :phone1
  expose :phone2
  expose :email
  expose :created_at
  expose :updated_at
end
