require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do

  let(:movie) { create(:movie) }
  let(:person) { create(:person) }

  describe "GET #index" do
    it 'returns status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    context 'with invalid credentials' do
      it 'returns status unauthorized' do
        get :show, params: {id: movie.to_param}
        expect(response).to have_http_status(:unauthorized)
      end
    end
    
    context 'with correct credentials' do
      include_context 'logged_user'

      it "returns status ok" do
        get :show, params: {id: movie.to_param}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST #create" do
    let(:new_movie_params) do
      {
        movie:
        {
          title: 'Invictus',
          release_year: 2009
        }
      }
    end
  
    let(:new_movie_params_with_errors) do
      {
        movie:
        {
          title: 10,
          release_year: [2009]
        }
      }
    end
  
    let(:new_movie_params_with_participations_attibutes) do
      {
        movie:
        {
          title: 'Invictus',
          release_year: 2009,
          participations_attributes: [
            {
              person_id: person.id,
              role: 'actor'
            }
          ]
        }
      }
    end

    context 'with invalid credentials' do
      it 'returns status unauthorized' do
        post :create, params: new_movie_params
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with correct credentials' do
      include_context 'logged_user'

      it "returns unprocessable_entity with wrong params" do
        post :create, params: new_movie_params_with_errors
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns status created" do
        post :create, params: new_movie_params
        expect(response).to have_http_status(:created)
      end

      it "returns casting size ok" do
        post :create, params: new_movie_params_with_participations_attibutes
        expect(JSON.parse(response.body)['casting'].size).to eq(1)
      end
    end
  end

  describe "PUT #update" do
    let(:update_movie_params) do
      {
        title: 'Forest Gump',
        release_year: 2010
      }
    end
  
    let(:update_movie_params_with_errors) do
      {
        title: nil,
        release: 2010
      }
    end

    context 'with invalid credentials' do
      it 'returns status unauthorized' do
        put :update, params: { id: movie.id, movie: update_movie_params }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with correct credentials' do
      include_context 'logged_user'

      it "returns unprocessable_entity with wrong params" do
        put :update, params: { id: movie.id, movie: update_movie_params_with_errors }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns status ok" do
        put :update, params: { id: movie.id, movie: update_movie_params }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
