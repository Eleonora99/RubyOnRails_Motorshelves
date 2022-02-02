Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users do
    resources :bikeadvs do 
      collection do
        get :findadv
      end
    end
    resources :bikesellingadvs do 
      collection do
        get :findadv
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"

  #Admin Actions
  get '/users/ban/:id', to: 'users#ban', :via => :get, :as => :ban_user
  get '/users/unban/:id', to: 'users#unban', :via => :get, :as => :unban_user
  get '/users/admin/:id', to: 'users#admin', :via => :get, :as => :admin_user
  get '/users/unadmin/:id', to: 'users#unadmin', :via => :get, :as => :unadmin_user

end
