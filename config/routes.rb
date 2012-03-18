Ordi::Application.routes.draw do
    
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  resources :karteikarten, :only => [:index, :new, :edit, :create, :update, :destroy] do
    resources :tiere,    :only => :new
    resources :behandlungen, :only => [:new, :destroy]
  end
  
  resources :abfragen, :only => :index
  
  root :to => 'karteikarten#index'
end
