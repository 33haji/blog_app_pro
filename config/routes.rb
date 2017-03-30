Rails.application.routes.draw do
  root 'index#home'
  
  namespace :profile do
    get :index
  end
  
  namespace :analysis do
    get :required_time
  end
  
  resources :tips do
    patch 'delete', :on => :member
  end
  
  resources :blogs do
    patch 'delete', :on => :member
  end
  
  resources :tip_genres
  
  namespace :manage do
    get :table_list
    get :column_list
  end
  
  namespace :sns do
    get :index
    get :show_tweet
    get :show_instagram
  end
end
