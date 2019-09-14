require 'rails_helper'

RSpec.describe 'Rental', type: :request do
  let(:user) { create(:user) }
  let(:user_token) { get_token(user.id, 'users') }
  let(:user_headers) { get_headers(user_token.token)}

  describe 'POST rentals#index' do
    let!(:movies) { create_list(:movie, 10)}
    let(:movie_to_rental) { Movie.active_and_available.sample }
    context 'when user is logged in' do
      let(:params) do
        {
            movie_id: movie_to_rental.id,
            qty: 2,
            must_returned_at: (Time.now + 2.days).end_of_day
        }
      end
      it 'should rental a movie' do
        post "/api/v1/users/#{user.id}/rentals",
             :params => params,
             :headers => user_headers
        expect(response).to have_http_status(:created)
        movie_after_rental = Movie.find(movie_to_rental.id)
        expect(movie_after_rental.stock).to eq movie_to_rental.stock - params[:qty]
      end
    end
    context 'when qty is higher than movie qty' do
      let(:params) do
        {
            movie_id: movie_to_rental.id,
            qty: 20,
            must_returned_at: Time.now + 2.days
        }
      end
      it 'should response with 422' do
        post "/api/v1/users/#{user.id}/rentals",
             :params => params,
             :headers => user_headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end