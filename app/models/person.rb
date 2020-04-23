class Person < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :participations, dependent: :destroy
  has_many :movies, through: :participations

  accepts_nested_attributes_for :participations, allow_destroy: true

  def add_movie(movie, role)
    participations.create(movie: movie, role: role)
  end

  def participations_as(role)
    movies.includes(:participations)
          .where('participations.role = ?', Participation.roles.dig(:"#{role.downcase.singularize}"))
  end
end
