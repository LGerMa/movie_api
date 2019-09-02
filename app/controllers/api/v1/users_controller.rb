class Api::V1::UsersController < Api::V1::BaseController
  before_action :doorkeeper_authorize!
  def me
    render json: current_user, status: :ok
  end
end
