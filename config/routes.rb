Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :items
  resources :roles
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/admin' do
    resources :users
  end
  authenticated :user do
    root to: 'items#index', as: :authenticated_root
  end
  root to: 'welcome#index'
end
