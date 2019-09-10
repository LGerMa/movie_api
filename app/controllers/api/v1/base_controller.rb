class Api::V1::BaseController < ApplicationController

  rescue_from CanCan::AccessDenied do |exception|
    render json: {'message': 'not_found'}, status: :not_found
  end

  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
