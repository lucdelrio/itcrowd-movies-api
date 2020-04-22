ActiveAdmin.register Movie do
  index do
    column :title
    column :release_year
    actions
  end

  filter :title

  show do |_s|
    attributes_table do
      row :title
      row :release_year
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Edit movie' do
      f.input :title
      f.input :release_year
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
