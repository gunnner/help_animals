ActiveAdmin.register Animal do
  permit_params :name, :breed, :sex, :age, :color, :features, :complex_vaccination, :rabies_vaccination, :sterilization, :animal_has_family,
                :responsible_person, :show_in_gallery, :edited_by, image_attributes: %i[id file imageable_type imageable_id]

  index do
    selectable_column
    id_column
    column :name
    column :breed
    column :sex
    column :age
    column :color
    column :features
    column :complex_vaccination
    column :rabies_vaccination
    column :sterilization
    column :animal_has_family
    column :responsible_person
    column :show_in_gallery
    column :image
    column :edited_by
    column :created_at
    actions
  end

  filter :breed
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :breed
      f.input :sex
      f.input :age
      f.input :color, as: String
      f.input :features
      f.input :complex_vaccination
      f.input :rabies_vaccination
      f.input :sterilization
      f.input :animal_has_family
      f.input :responsible_person
      f.input :show_in_gallery
      f.input :edited_by
      f.inputs 'Image', for: [:image, f.object.image || f.object.build_image] do |fi|
        fi.input :file
      end
    end
    f.actions
  end
end
