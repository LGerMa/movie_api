require 'rails_helper'

RSpec.describe 'Movie', type: :request do
  let(:admin) { create(:admin) }
  let(:admin_token) { get_token(admin.id, 'users') }
  let(:admin_headers) { get_headers(admin_token.token)}

  let(:user) { create(:user) }
  let(:user_token) { get_token(user.id, 'users') }
  let(:user_headers) { get_headers(user_token.token)}

  describe 'GET movies#index' do
    let!(:movies) { create_list(:movie, 10)}
    context 'when user is logged or not' do
      it 'should show all movies active and available' do
        get '/api/v1/movies'
        expect(json).not_to be_empty
        expect(json.count).to eq Movie.active_and_available.count
      end
    end
  end

  describe 'POST movies#index' do
    let(:params) do
      hp = Faker::Movies::HarryPotter
      {
          title: hp.book,
          description: hp.quote,
          stock: (10..15).to_a.sample,
          rental_price: (1000..10000).to_a.sample,
          sale_price: (1000..10000).to_a.sample,
          availability: (1..10).to_a.sample % 2 == 0,
          status: 'active'
      }
    end
    context 'When user is admin' do
      it 'should create a new movie' do
        post '/api/v1/movies', :params => params, :headers => admin_headers
        expect(response).to have_http_status(:created)
      end
    end
    context 'When user is NOT admin' do
      it 'should not create a new movie' do
        post '/api/v1/movies', :params => params, :headers => user_headers
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PATCH movies/:id#update' do
    let!(:movies) { create_list(:movie, 10)}
    let(:movie_to_update) { Movie.all.sample}
    let(:params_to_update) do
      {
          description: 'This is a great movie!',
          availability: true
      }
    end
    context 'When user is admin' do
      it 'should update a movie info' do
        patch "/api/v1/movies/#{movie_to_update.id}",
              :params => params_to_update,
              :headers => admin_headers
        expect(response).to have_http_status(:ok)
        expect(json[:description]).to eq(params_to_update['description'])
      end
    end
    context 'When user is NOT admin' do
      it 'should NOT update a movie info' do
        patch "/api/v1/movies/#{movie_to_update.id}",
              :params => params_to_update,
              :headers => user_headers
        expect(response).to have_http_status(:not_found)
      end
    end
    context 'When user is NOT LOGGED IN' do
      it 'should NOT update a movie info' do
        patch "/api/v1/movies/#{movie_to_update.id}",
              :params => params_to_update
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end
