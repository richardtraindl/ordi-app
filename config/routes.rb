Ordi::Application.routes.draw do
    
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  resources :karteikarten do
    member do
      get 'neues_tier'
      delete 'destroy_behandlung'
    end
  end
  
  resources :abfragen  
  
  root :to => 'karteikarten#index'
end
