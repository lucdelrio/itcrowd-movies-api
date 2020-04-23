class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :casting, :directors, :producers

  def casting
    object.participants('casting')
  end

  def directors
    object.participants('director')
  end

  def producers
    object.participants('producer')
  end
end
