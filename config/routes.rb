Rails.application.routes.draw do
  root to: 'pages#home'
  get	'dashboard' => 'pages#dashboard'
  devise_for :users, 
  	path: '',
  	path_names: {:sign_in => 'login', :sign_out => 'logout'},
  	controllers: {registrations: 'registrations'}
  resources :tasks
end
