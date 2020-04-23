class Movie < ApplicationRecord
  validates :title, :release_year, presence: true

  has_many :participations, dependent: :destroy
  has_many :people, through: :participations, as: :people_participated

  accepts_nested_attributes_for :participations, allow_destroy: true

  def people_participated
    people
  end

  def add_participant(person, role)
    participations.create(person: person, role: role)
  end

  def participants(role)
    return casting if role.casecmp('casting').zero?

    people.includes(:participations)
          .where('participations.role = ?', Participation.roles.dig(:"#{role.downcase.singularize}"))
  end

  private

  def casting
    actors + actresses
  end

  def actresses
    people.includes(:participations).where('participations.role = ?', Participation.roles.dig(:actress))
  end

  def actors
    people.includes(:participations).where('participations.role = ?', Participation.roles.dig(:actor))
  end
end
