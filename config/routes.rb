Rails.application.routes.draw do
  root 'daily_reports#index'
  
  resources :events
  resources :daily_reports do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
