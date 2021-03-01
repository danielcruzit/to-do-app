# frozen_string_literal: true

Rails.application.routes.draw do
  root "lists#index"
  resources :lists
  resources :tasks do 
    member do 
      patch :change_completed
    end
  end
end
