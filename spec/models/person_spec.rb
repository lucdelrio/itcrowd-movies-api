require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  let(:movie) { create(:movie) }
  let(:person) { create(:person) }

  describe '#movies' do
    context 'when a person participates in a movie' do
      it 'returns person has movie' do
        person.add_movie(movie, 'director')

        expect(person.movies).not_to be_empty
      end

      it 'returns the same movie and person participated' do
        person.add_movie(movie, 'director')

        expect(person.movies.first.title).to eq(movie.title)
      end
    end

    context 'when a person participates in several movies' do
      it 'returns the movies with producer role' do
        person.add_movie(movie, 'director')
        person.add_movie(movie, 'actor')
        person.add_movie(movie, 'producer')
        person.add_movie(movie, 'producer')

        expect(person.participations_as('producer').size).to eq(2)
      end
    end
  end
end
