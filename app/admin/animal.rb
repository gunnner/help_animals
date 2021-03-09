ActiveAdmin.register Animal do
  permit_params :breed, :sex, :color, :features, :complex_vaccination, :rabies_vaccination, :sterilization, :animal_has_family, :responsible_person

  index do
    selectable_column
    id_column
    column :breed
    column :sex
    column :color
    column :features
    column :complex_vaccination
    column :rabies_vaccination
    column :sterilization
    column :animal_has_family
    column :responsible_person
    column :created_at
    actions
  end

  filter :breed
  filter :created_at

  form do |f|
    f.inputs do
      f.input :breed
      f.input :sex
      f.input :color
      f.input :features
      f.input :complex_vaccination
      f.input :rabies_vaccination
      f.input :sterilization
      f.input :animal_has_family
      f.input :responsible_person
      f.input :created_at
    end
    f.actions
  end

end
