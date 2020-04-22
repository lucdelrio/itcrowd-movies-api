class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :show_not_found_errors
  
  def show_not_found_errors(_exception)
    render json: { error: 'not_found' }, status: :not_found
  end
end
