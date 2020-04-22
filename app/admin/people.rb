ActiveAdmin.register Person do
  index do
    column :first_name
    column :last_name
    actions
  end

  filter :last_name

  show do |_s|
    attributes_table do
      row :first_name
      row :last_name
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Edit person' do
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
