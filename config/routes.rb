Rails.application.routes.draw do
  resources :chat_interfaces do
    resources :messages
  end

  devise_for :users

  root to: 'chat_interfaces#index'
end
