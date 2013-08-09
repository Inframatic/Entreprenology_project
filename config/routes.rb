Entreprenology::Application.routes.draw do
  get "favourited_lists/index"
  get "favourited_lists/edit"

  namespace :api do
  	resources :interns
  	resources :startups do
      resources :internships do
        resources :internship_contacts, :except => [:index]
      end
    end
  end

  resources :accounts do
    resources :favourited_list
  end

	resources :sessions, :only => [:new, :create, :destroy]

	root :to => 'welcome#index'
  get '*anything' => "welcome#index"

end