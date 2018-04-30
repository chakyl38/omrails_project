Rails.application.routes.draw do
	root 'pages#home'
	get 'about' => 'pages#about'
	get 'contact-us' => 'pages#contact_us'

end
