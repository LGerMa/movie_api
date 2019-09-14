class Api::V1::PurshasesController < Api::V1::BaseController
  before_action :doorkeeper_authorize!
  load_and_authorize_resource

  def index
    render json: current_user.purshases.ordered, status: :ok
  end

  def create
    purshase_info = purshase_params
    movie_info = Movie.find(purshase_info[:movie_id])
    if movie_info.present?
      if movie_info.stock >= purshase_info[:qty].to_i
        purshase_info[:subtotal] = movie_info.sale_price * purshase_info[:qty].to_i
        purshase_info[:total] = purshase_info[:subtotal]
        purshase_info[:movie_price] = movie_info.sale_price
        purchase = current_user.purshases.create!(purshase_info)
        render json: purchase, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :not_found
    end
  end

  private

  def purshase_params
    params.permit(:movie_id, :qty)
  end
end
