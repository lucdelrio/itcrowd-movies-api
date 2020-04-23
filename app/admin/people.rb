# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Person do
  index do
    column :first_name
    column :last_name
    actions
  end

  filter :last_name

  show do |s|
    attributes_table do
      row :first_name
      row :last_name
      row :created_at
    end

    panel 'Actor/Actress' do
      'No movies as actor/actress' if !s.participations_as('actor').empty? && !s.participations_as('actress').empty?

      unless s.participations_as('actor').empty?
        table_for s.participations_as('actor') do |u|
          u.column('Movies') do |t|
            t.title.to_s
          end
        end
      end

      unless s.participations_as('actress').empty?
        table_for s.participations_as('actress') do |u|
          u.column('Movies') do |t|
            t.title.to_s
          end
        end
      end
    end

    panel 'Director' do
      if s.participations_as('director').empty?
        'No movies as director'
      else
        table_for s.participations_as('director') do |u|
          u.column('Movies') do |t|
            t.title.to_s
          end
        end
      end
    end

    panel 'Producer' do
      if s.participations_as('producer').empty?
        'No movies as producer'
      else
        table_for s.participations_as('producer') do |u|
          u.column('Movies') do |t|
            t.title.to_s
          end
        end
      end
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
# rubocop:enable Metrics/BlockLength
