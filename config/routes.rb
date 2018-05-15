Rails.application.routes.draw do
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
