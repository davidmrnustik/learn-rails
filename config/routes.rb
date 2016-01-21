Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  #match 'visitors' => 'visitors#create', :via => ['post', 'put']
  root to: 'visitors#new'  
end
