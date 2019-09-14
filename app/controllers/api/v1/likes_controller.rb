class Api::V1::LikesController < Api::V1::BaseController
  before_action :doorkeeper_authorize!
  load_and_authorize_resource

  def create
    like = current_user.likes.create!(like_params)
    render json: like, status: :created
  end

  private

  def like_params
    params.permit(:movie_id)
  end
end
