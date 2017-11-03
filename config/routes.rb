Rails.application.routes.draw do    
  devise_for :users, :controllers => {registrations: 'registrations',
  									   omniauth_callbacks: "callbacks" }  

  resources :genres do
  	member do
  		get 'mark_favorite'
  		get 'remove_favorite'      
  	end
    resources :books do
      resources :reviews
    end
  end

  resources :ratings, only: :update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
