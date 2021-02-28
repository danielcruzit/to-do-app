# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/list', to: "list#home"
  resources :lists
  resources :tasks
end
