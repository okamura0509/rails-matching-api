Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]
      resources :likes, only: %i[index create]
      resources :chat_rooms, only: %i[index show]
      resources :messages, only: %i[create]
      resources :requests, only: %i[index create]
      resources :users do
        member do
          get :show, action: :show
          post :update, action: :update
          get :search, action: :search
        end
        collection do
        end
      end

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end
