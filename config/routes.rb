Ordi::Application.routes.draw do
    
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  resources :karteikarten do
    resources :tiere
    resources :behandlungen 
  end
  
  resources :abfragen  
  
  root :to => 'karteikarten#index'
end
