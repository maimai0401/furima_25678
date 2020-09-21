Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items do
    resources :transactions, only: [:index, :create]
  end

end
