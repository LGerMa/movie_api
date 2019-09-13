class Api::V1::MoviesController < Api::V1::BaseController
  before_action :doorkeeper_authorize!, only: [:create, :update]
  load_and_authorize_resource
  before_action :set_movie, only: [:show, :update]

  def index
    render json: Movie.active_and_available, status: :ok
  end

  def create
    Movie.create!(movie_params)
    render json: {}, status: :created
  end

  def show
    render json: @movie, status: :ok
  end

  def update
    @movie.update!(movie_params)
    set_movie
    render json: @movie, status: :ok
  end

  private

  def movie_params
    params.permit(:title, :description, :stock, :rental_price, :sale_price, :availability, :status)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
