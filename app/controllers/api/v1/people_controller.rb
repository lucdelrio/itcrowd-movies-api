module Api::V1
  class PeopleController < ApiController
    before_action :authenticate_user!, only: %i[create show update]

    # GET /people
    def index
      render json: Person.all
    end
  
    # GET /people/1
    def show
      person = Person.find(params[:id])
      render json: person
    end

    # POST /people
    def create
      person = Person.new(person_params)
      return render json: person, status: :created if person.save

      render json: person.errors, status: :unprocessable_entity
    end

    # PATCH/PUT /people/1
    def update
      person = Person.find(params[:id])
      return render json: person, status: :ok if person.update(person_params)
    
      render json: person.errors, status: :unprocessable_entity
    end

    private
    
    def person_params
      params.require(:person)
            .permit(:first_name, :last_name,
                    participations_attributes: %i[id movie_id role])
    end
  end
end
