Rails.application.routes.draw do
  get 'categories/new'

  get 'categories/create'

  root to: 'pages#home'
  get	'dashboard' => 'pages#dashboard'
  
  devise_for :users, 
  	path: '',
  	path_names: {:sign_in => 'login', :sign_out => 'logout'},
  	controllers: {registrations: 'registrations'}
  
  resources :tasks do 
  	member do
  		put :status
  	end
  end
end
