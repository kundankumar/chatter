Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :followers
      get :followings
      get :timeline
      get :tweets
    end
  end

  resources :tweets
  root 'users#index'

  get 'users/:user_id1/follows/:user_id2', to: 'users#follow_user'

end
