# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chat_interfaces, only: %i[index show create] do
    resources :messages, only: %i[create]
  end

  devise_for :users

  root to: 'chat_interfaces#index'
end
