 ActiveAdmin.register Request do
  permit_params :address, :opened_date, :user_id

  index do
    selectable_column
    id_column
    column :address
    column :opened_date
    column :closed_date
    column 'User Created', :user_id
    column :user_closed_id
    actions
  end

  filter :created_at

  form do |f|
    f.inputs do
      f.input :address
      f.input :opened_date
      f.input :closed_date
      f.input :user_id
      f.input :user_closed_id
    end
    f.actions
  end
end
