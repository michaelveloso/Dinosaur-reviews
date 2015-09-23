Rails.application.routes.draw do
  root 'dinosaurs#index'
  devise_for :users
  resources :dinosaurs do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update]
  end
  resources :reviews, only: [:edit, :update, :destroy] do
    resources :comments, only: [:new, :create]
  end
end
