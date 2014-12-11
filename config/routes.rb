Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
  	post :sms
    resources :comments
  end
  
  devise_for :users
end
