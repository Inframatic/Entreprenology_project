Entreprenologyproject::Application.routes.draw do
	resources :accounts
	resources :interns
	resources :startups do 
    resources :internships do
      resources :internship_contacts, :except => [:index]
    end
  end

	resources :sessions, :only => [:new, :create, :destroy]

	root :to => 'welcome#index'

end

  # get "log_in" => "sessions#new", :as => "log_in"
  # get "log_out" => "sessions#destroy", :as => "log_out"
  # get "sign_up" => "users#new", :as => "sign_up"
  # #get "my_account" => "users#show", :as => "my_account"
  # get "my_account" => "users#edit", :as => "my_account"

  # get "main/index"

  # resources :users
  # resources :sessions