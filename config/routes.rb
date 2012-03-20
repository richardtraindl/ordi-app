Ordi::Application.routes.draw do
    
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  #, :only => [:index, :new, :edit, :create, :update, :destroy]
  resources :karteikarten do
    get 'print', :on => :member    
    resources :tiere,    :only => :new
    resources :behandlungen, :only => :destroy
  end
  
  resources :abfragen, :only => :index
  
  root :to => 'karteikarten#index'
end
