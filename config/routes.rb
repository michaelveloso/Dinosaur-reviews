Rails.application.routes.draw do
  root 'dinosaurs#index'
  devise_for :users
  resources :dinosaurs do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update] do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
        put "unvote", to: "reviews#unvote"
      end
    end
  end
  resources :reviews, only: [:edit, :update, :destroy] do
    resources :comments, only: [:new, :edit, :create, :update]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
end
