class Api::V1::RentalsController < Api::V1::BaseController
  before_action :doorkeeper_authorize!
  load_and_authorize_resource
  before_action :set_rental, only: [:show, :rental_returned]

  def index

  end

  def create
    rental_info = rental_params
    movie_info = Movie.find(rental_info[:movie_id])
    if movie_info.present?
      if movie_info.stock >= rental_info[:qty].to_i
        rental_info[:subtotal] = movie_info.rental_price * rental_info[:qty].to_i
        #rental_info[:total] = movie_info.rental_price * rental_info[:qty].to_i
        rental_info[:movie_price] = movie_info.rental_price
        rental = current_user.rentals.create!(rental_info)
        render json: rental, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end
  end

  def rental_returned
    @rental.update!({ returned_at: Time.now })
    @rental.done!
    set_rental
    render json: @rental, status: :ok
  end

  def show
    render json: @rental, status: :ok
  end

  private

  def rental_params
    params.permit(:movie_id, :qty, :must_returned_at)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
