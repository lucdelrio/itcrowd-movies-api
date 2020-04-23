require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:release_year) }

  let(:movie) { create(:movie) }
  let(:person) { create(:person) }

  describe '#participants' do
    context 'when the participant is added as an actor' do
      it 'returns people in the movie' do
        movie.add_participant(person, 'actor')

        expect(movie.people_participated).not_to be_empty
      end

      it 'returns an actor in the movie' do
        movie.add_participant(person, 'actor')
        expect(movie.participants('actor').first.last_name).to eq(person.last_name)
      end
    end

    context 'when movie has no participans' do
      it 'returns a empty' do
        expect(movie.participants('actor')).to be_empty
      end
    end

    context 'when query for participant casting' do
      it 'returns an actors and actresses' do
        movie.add_participant(person, 'actor')
        movie.add_participant(person, 'actress')

        expect(movie.participants('casting').size).to eq(2)
      end
    end
  end
end
