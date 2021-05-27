Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  
  resources :homes do
    collection do
      get 'search'
      get 'about'
    end
  end
  resources :events
  resources :daily_reports do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
