class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
             :participations_as_actor, :participations_as_director, :participations_as_producer

  def participations_as_actor
    object.participations_as('actor')
  end

  def participations_as_director
    object.participations_as('director')
  end

  def participations_as_producer
    object.participations_as('producer')
  end
end
