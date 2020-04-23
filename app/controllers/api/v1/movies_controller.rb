module Api
  module V1
    class MoviesController < ApiController
      before_action :authenticate_user!, only: %i[create update]

      # GET /movies
      def index
        render json: Movie.all
      end

      # GET /movies/1
      def show
        movie = Movie.find(params[:id])
        render json: movie
      end

      # POST /movies
      def create
        movie = Movie.new(movie_params)
        return render json: movie, status: :created if movie.save

        render json: movie.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /movies/1
      def update
        movie = Movie.find(params[:id])
        return render json: movie, status: :ok if movie.update(movie_params)

        render json: movie.errors, status: :unprocessable_entity
      end

      private

      def movie_params
        params.require(:movie)
              .permit(:title, :release_year,
                      participations_attributes: %i[id person_id role])
      end
    end
  end
end
