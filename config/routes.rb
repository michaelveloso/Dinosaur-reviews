Rails.application.routes.draw do
  root 'dinosaurs#index'
  devise_for :users
  resources :dinosaurs, only: [:index, :show] do
    resources :reviews, only: [:create, :new, :destroy]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
