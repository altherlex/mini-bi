Rails.application.routes.draw do
  resources :panels


  get "start/index"

  resources :columns


  resources :universes
  root :to => "start#index"

end
