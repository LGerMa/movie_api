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

  def search
    page = 0
    per_page = 10
    page = search_params[:page].to_i if search_params[:page].present?
    per_page = search_params[:per_page].to_i if search_params[:per_page].present?
    movie = Movie.active_and_available
    movie = movie.find_by_title(search_params[:name]) if search_params[:name].present?
    movie = movie.sort_by_title
    movie = movie.limit(per_page).offset(page)
    render json: movie, status: :ok
  end

  private

  def movie_params
    params.permit(:title, :description, :stock, :rental_price, :sale_price, :availability, :status)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def search_params
    params.permit(:page, :per_page, :name)
  end
end
