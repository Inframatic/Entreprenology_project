Entreprenologyproject::Application.routes.draw do
	resources :accounts
	resources :interns
	resources :startups
	resources :sessions, :only => [:new, :create, :destroy]

	root :to => 'welcome#index'

end