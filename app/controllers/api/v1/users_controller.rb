class Api::V1::UsersController < Api::V1::BaseController
  before_action :doorkeeper_authorize!, only: [:me]
  load_and_authorize_resource
  def me
    render json: current_user, status: :ok
  end

  def me2
    render json: User.new, status: :ok
  end

  def index
    render json: User.all, status: :ok
  end
end
