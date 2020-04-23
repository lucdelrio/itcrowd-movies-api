ActiveAdmin.register Movie do
  index do
    column :title
    column :release_year
    actions
  end

  filter :title
  filter :release_year

  show do |s|
    attributes_table do
      row :title
      row :release_year
      row :created_at
    end

    panel 'Casting' do
      if s.participants('casting').empty?
        'No casting for this movie'
      else
        table_for s.participants('casting') do |u|
          u.column('First name') do |t|
            t.first_name.to_s
          end
          u.column('Last name') do |t|
            t.last_name.to_s
          end
        end
      end
    end

    panel 'Directors' do
      if s.participants('director').empty?
        'No director for this movie'
      else
        table_for s.participants('director') do |u|
          u.column('First name') do |t|
            t.first_name.to_s
          end
          u.column('Last name') do |t|
            t.last_name.to_s
          end
        end
      end
    end

    panel 'Producers' do
      if s.participants('producer').empty?
        'No producer for this movie'
      else
        table_for s.participants('producer') do |u|
          u.column('First name') do |t|
            t.first_name.to_s
          end
          u.column('Last name') do |t|
            t.last_name.to_s
          end
        end
      end
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
