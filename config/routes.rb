Rails.application.routes.draw do
  root 'dinosaurs#index'
  devise_for :users
  resources :dinosaurs do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update] do
      member do
        put "like", to: "posts#upvote"
        put "dislike", to: "posts#downvote"
      end
    end
  end
  resources :reviews, only: [:edit, :update, :destroy] do
    resources :comments, only: [:new, :edit, :create, :update]
  end
end
