ActiveAdmin.register User do
  permit_params :email, :login, :phone1, :phone2, :password, :name, roles_attributes: %i[id name resource_type resource_id], role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :login
    column :phone1
    column :phone2
    column 'Role', :roles
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :login
      f.input :password
      f.input :name
      f.input :phone1
      f.input :phone2
      f.input :roles, as: :check_boxes, multiple: true, collection: Role.all
    end
    f.actions
  end

  controller do
    def update
      remove_params

      if params[:user][:role_ids].empty?
        redirect_to request.referrer, flash: { error: 'Roles can`t be blank' }
      else
        super
      end
    end

    def remove_params
      if params[:user][:password].blank?
        params[:user].tap do |user|
          user.delete 'password'
        end
      end
      params[:user][:role_ids].delete ''
    end
  end
end
