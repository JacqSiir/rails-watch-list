Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :lists, only: [:index, :show, :update, :create, :new]
  resources :bookmarks, only: [:index, :create, :new, :destroy]
  resources :movies, only: [:index, :show, :create, :new, :edit]
end
