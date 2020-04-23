require 'rails_helper'

RSpec.describe Api::V1::PeopleController, type: :controller do
  let(:person) { create(:person) }
  let(:movie) { create(:movie) }

  describe 'GET #index' do
    it 'returns status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns status ok' do
      get :show, params: { id: person.to_param }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:new_person_params) do
      {
        person:
        {
          first_name: 'Matt',
          last_name: 'Damon'
        }
      }
    end

    let(:new_person_params_with_errors) do
      {
        person:
        {
          first_name: nil,
          last_name: 'Damon'
        }
      }
    end

    let(:new_person_params_with_participations_attibutes) do
      {
        person:
        {
          first_name: 'Matt',
          last_name: 'Damon',
          participations_attributes: [
            {
              movie_id: movie.id,
              role: 'director'
            }
          ]
        }
      }
    end

    context 'with invalid credentials' do
      it 'returns status unauthorized' do
        post :create, params: new_person_params
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with correct credentials' do
      include_context 'logged_user'

      it 'returns unprocessable_entity with wrong params' do
        post :create, params: new_person_params_with_errors
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns status created' do
        post :create, params: new_person_params
        expect(response).to have_http_status(:created)
      end

      it 'returns director size ok' do
        post :create, params: new_person_params_with_participations_attibutes
        expect(JSON.parse(response.body)['participations_as_director'].size).to eq(1)
      end
    end
  end

  describe 'PUT #update' do
    let(:update_person_params) do
      {
        first_name: 'Matt',
        last_name: 'Damon'
      }
    end

    let(:update_person_params_with_errors) do
      {
        first_name: 'Matt',
        last_name: nil
      }
    end

    context 'with invalid credentials' do
      it 'returns status unauthorized' do
        put :update, params: { id: person.id, person: update_person_params }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with correct credentials' do
      include_context 'logged_user'

      it 'returns unprocessable_entity with wrong params' do
        put :update, params: { id: person.id, person: update_person_params_with_errors }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns status ok' do
        put :update, params: { id: person.id, person: update_person_params }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
