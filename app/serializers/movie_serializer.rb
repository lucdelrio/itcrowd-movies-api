class MovieSerializer < ActiveModel::Serializer
  include RomanConverter

  attributes :id, :title, :release_year, :casting, :directors, :producers

  def release_year
    convert_to_roman(object.release_year)
  end

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
