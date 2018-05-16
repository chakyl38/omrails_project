Rails.application.routes.draw do
  #get 'users/:username', to: 'users#show', as: 'user'


  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :items
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  # as :user do
  # 	get "signin" => 'devise/session#new'
  # 	delete "signout" => 'devise/sessions#destroy'
  # 	get "signup" => 'devise/registration#new'
  # end
	root 'pages#home'
	get 'about' => 'pages#about'
	get 'contact-us' => 'pages#contact_us'

end
