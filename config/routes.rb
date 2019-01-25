Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      delete '/relationships', to: 'relationships#destroy'
      get '/content', to: 'users#content'
      post '/ChannelBlock', to: 'channel_block#create'
      post '/channels/followers', to: 'channels#channel_follower'
      delete '/channels/followers', to: 'channels#channel_unfollower'
      patch '/logout', to: 'users#logout'

      resources :feeds, only: [:show]
      resources :comments, only: [:create]
      resources :blocks
      resources :channels, only: [:index, :show, :create, :destroy]
      resources :users, only: [:create, :show, :update, ]
      resources :relationships, only: [:create, :destroy, :index]
    end
  end

  post '/rails/active_storage/direct_uploads' => 'direct_uploads#create'

end
