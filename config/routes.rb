# frozen_string_literal: true

Rails.application.routes.draw do
  # root 'list_of_tasks#home'
  get 'index', to: 'list_of_tasks#index'

  resources :list_of_tasks
end
