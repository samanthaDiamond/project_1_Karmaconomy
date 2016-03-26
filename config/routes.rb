Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, :deeds, :orders

  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
