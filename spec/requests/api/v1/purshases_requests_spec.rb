require 'rails_helper'

RSpec.describe 'Purshase', type: :request do
  let(:user) { create(:user) }
  let(:user_token) { get_token(user.id, 'users') }
  let(:user_headers) { get_headers(user_token.token)}
  let!(:movies) { create_list(:movie, 10)}
  let(:movie_to_purshase) { Movie.active_and_available.sample }

  describe 'POST purshases#index' do
    context 'when user is logged in' do
      let(:params) do
        {
            movie_id: movie_to_purshase.id,
            qty: 2
        }
      end
      it 'should purshase a movie' do
        post "/api/v1/users/#{user.id}/purshases",
             params: params,
             headers: user_headers
        expect(response).to have_http_status(:created)
        movie_after_purshase = Movie.find(movie_to_purshase.id)
        expect(movie_after_purshase.stock).to eq movie_to_purshase.stock - params[:qty]
      end
    end
  end
end