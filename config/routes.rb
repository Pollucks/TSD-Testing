Rails.application.routes.draw do
  get 'characters/index'
    resources :characters do
      resources :comments
    end
  root 'characters#index'
end
