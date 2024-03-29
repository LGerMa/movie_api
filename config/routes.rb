Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :password, :registrations]
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :authorizations
  end

  namespace :api do
    namespace :v1 do
      get '/users/me', to: 'users#me'
      get '/users/me2', to: 'users#me2'
      get '/movies/search', to: 'movies#search'
      resources :movies do
        resources :likes
      end
      resources :users do
        resources :rentals
        patch '/rentals/:id/rental_returned', to: 'rentals#rental_returned'
        resources :purshases
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
