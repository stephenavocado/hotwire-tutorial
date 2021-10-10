Rails.application.routes.draw do
  devise_for :users
  resources :discussions, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :posts, only: [:create], module: :discussions
  end
  root to: "main#index"
end
