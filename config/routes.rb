Rails.application.routes.draw do
  devise_for :admins


  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/dashboard'
  get 'home/userhomepage'
  get 'locations/userloc'
  get 'stations/userstations'
  get 'powerbanks/userpowerbanks'
  get 'devise/admincreatsuser'


  resources :warehouses
  resources :powerbanks do
  collection do
    get 'userpowerbanks'
  end
end

  resources :stations do
  collection do
    get 'userstations'
  end
end

  resources :locations do
    collection do
      get 'userloc'
    end
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
