Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'balloons#index', as:'home'
  root 'seatmaps#index', as:'home'
  get 'about' => 'pages#about', as:'about'
  get 'about2' => 'pages#about2', as:'about2'
  get 'show' => 'balloons#show'
  get 'new' => 'balloons#new'
  get 'counts' => 'counts#index'
  get 'edit' => 'balloons#edit'
  # added for feature-001
  get 'seatmaps' => 'seatmaps#index'
  # get 'generateSVG' => 'seatmaps#generateSVG'
  
  # added for tests
  post 'balloon_new' =>'balloons#new'
  post 'balloon_edit' =>'balloons#edit'

  # added for feature-002 - calling controller method from linke
  # post 'seatmap_generateSVG' =>'seatmaps#generateSVG'
  # post 'seatmaps/4' =>'seatmaps#generate'
  # post 'generate'=>'seatmaps#generate(.:format)'
  get 'counts/:id/export_svg' => 'counts#export_svg', :as => 'export_svg'
  
  resources :balloons do 
    resources :comments
  end

  resources :counts
  resources :seatmaps

  namespace 'api' do
    namespace 'v1' do
      resources :balloons
      resources :comments
    end
  end

end
