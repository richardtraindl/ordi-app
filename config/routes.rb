Ordi::Application.routes.draw do
    
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  resources :karteikarten do
    member do
      get 'neues_tier'
      get 'edit_behandlung'
      delete 'destroy_behandlung'
    end
    collection do
      get 'abfragen'
    end
  end
  
  root :to => 'karteikarten#index'
end
