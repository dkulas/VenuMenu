Rails.application.routes.draw do

  root 'users#home'

  resources :users do 
    resources :comments
  end

  resources :comments do
  	member { post :vote }
  end

  resources :venues, only: [:index, :show]

  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/signout' => 'sessions#destroy', :as => :signout

end
