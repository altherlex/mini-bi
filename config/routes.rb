Rails.application.routes.draw do
  resources :widgets do 
    get :execute, :on=>:member
  end
  resources :panels

  get "start/index"

  resources :columns

  resources :universes
  root :to => "start#index"
end
