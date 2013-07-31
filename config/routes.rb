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