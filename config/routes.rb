Rails.application.routes.draw do
 
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root                   'static_pages#home'
  get    'help'       => 'static_pages#help'
  get    'about'      => 'static_pages#about'
  get    'contact'    => 'static_pages#contact'
  get    'irc'        => 'static_pages#irc'
  get    'signup'     => 'users#new'
  get    'login'      => 'sessions#new'
  post   'login'      => 'sessions#create'
  delete 'logout'     => 'sessions#destroy'
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts do 
    member do
      put "like", to: "microposts#upvote"
      put "dislike", to: "microposts#downvote"
      put "unvote", to: "microposts#unvote"
    end
  end

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
