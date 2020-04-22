ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Last movies' do
          table_for Movie.order(id: :desc).limit(10) do |o|
            o.column('Title', &:title)
            o.column('Actions') { |u| link_to 'Go', admin_movie_path(u) }
          end
        end
      end
    end

    columns do
      column do
        panel 'Last people' do
          table_for Person.order(id: :desc).limit(10) do |u|
            u.column('First name', &:first_name)
            u.column('Last name', &:last_name)
            u.column('Actions') { |o| link_to 'Go', admin_person_path(o) }
          end
        end
      end
    end
  end
end
