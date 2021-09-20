Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'

  resources :hot_springs, only: [:index, :show, :edit, :create, :update, :destroy]do
  resource :favorites, only: [:create, :destroy]
  resources :hot_spring_comments, only: [:create, :destroy]
  end  
  
  resources :users, only: [:index, :show, :edit, :update]do
  resource :relationships, only: [:create, :destroy]
  end

end
