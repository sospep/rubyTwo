Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'balloons#index', as:'home'
  get 'about' => 'pages#about', as:'about'
  get 'show' => 'balloons#show'
  get 'new' => 'balloons#new'
  resources :balloons do 
    resources :comments
  end
end
