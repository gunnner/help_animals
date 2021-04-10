class Help::Entities::Request < Grape::Entity
  expose :id
  expose :address
  expose :opened_date
  expose :closed_date
  expose :user_id, as: :user_created_id
  expose :user_closed_id
end
