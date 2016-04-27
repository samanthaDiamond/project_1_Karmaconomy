Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, :deeds, :orders, :categories

  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/deeds/:id/accept' => 'deeds#accept'
  post '/deeds/:id/accepted' => 'deeds#accepted', :as => "accept_deed"

  get '/deeds/:id/complete' => 'deeds#complete'
  post '/deeds/:id/completed' => 'deeds#completed', :as => "deed_completed"

end
