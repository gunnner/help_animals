ActiveAdmin.register User do
  permit_params :email, :login, :phone1, :phone2, :permissions

  index do
    selectable_column
    id_column
    column :email
    column :login
    column :phone1
    column :phone2
    column :permissions
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :login
      f.input :phone1
      f.input :phone2
      f.input :permissions
      f.input :created_at
    end
    f.actions
  end
end
