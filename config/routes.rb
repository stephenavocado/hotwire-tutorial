Rails.application.routes.draw do
  devise_for :users
  resources :discussions, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  root to: "main#index"
end
