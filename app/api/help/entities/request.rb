class Help::Entities::Request < Grape::Entity
  expose :id
  expose :address
  expose :user_id, as: :user_created_id
  expose :user_name_open
  expose :opened_date
  expose :user_closed_id
  expose :user_name_close
  expose :closed_date
end
