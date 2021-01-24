Rails.application.routes.draw do
  # post '/users/:id/rides', to: 'rides#create'
  # get '/users/:id/rides/new', to: 'rides#new'
  # 
  resources :rides

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/dashboard', to: "dashboard#index"

  root 'pages#home'
end
