Rails.application.routes.draw do    
  resources :books
  devise_for :users, :controllers => {registrations: 'registrations',
  									   omniauth_callbacks: "callbacks" }  

  resources :genres do
  	member do
  		get 'mark_favorite'
  		get 'remove_favorite'      
  	end
    resources :books
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
