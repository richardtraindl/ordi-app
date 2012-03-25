Ordi::Application.routes.draw do
  
  resources :user_sessions
  
  resources :users
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout  
    
  resources :karteikarten do
    get 'print', :on => :member
    
    resources :tiere, :only => :new
    
    resources :behandlungen, :only => :destroy
  end
  
  resources :abfragen, :only => :index
  
  root :to => 'karteikarten#index'
end
