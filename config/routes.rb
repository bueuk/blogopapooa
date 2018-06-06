Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', profiles: 'users/profiles' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blog_posts#index'

  resources :blog_posts, only: [:show, :new, :create, :edit, :update, :destroy] do
    get 'pinit', on: :member
    get 'unpin', on: :member
    get 'show_all', on: :collection
  end

  resources :images, only: [:create, :destroy]

  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy] do
    get 'index_posts', on: :member
  end

  resources :archives, only: [:index]

  resources :users_info, only: [:index, :edit, :update]
end
