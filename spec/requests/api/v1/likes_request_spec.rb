require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let(:user) { create(:user) }
  let(:user_token) { get_token(user.id, 'users') }
  let(:user_headers) { get_headers(user_token.token)}
  let!(:movies) { create_list(:movie, 10)}
  let(:movie_to_like) { Movie.active_and_available.sample }

  describe 'POST likes#index' do
    context 'whem user is logged in' do
      let(:params) do
        {
            movie_id: movie_to_like.id
        }
      end

      it 'should like a movie' do
        post "/api/v1/movies/#{movie_to_like.id}/likes",
             headers: user_headers
        expect(response).to have_http_status(:created)
      end
    end
    context 'when user is NOT logged in' do
      let(:params) do
        {
            movie_id: movie_to_like.id
        }
      end
      it 'should NOT like a movie' do
        post "/api/v1/movies/#{movie_to_like.id}/likes"
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end