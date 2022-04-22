# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :employees
  
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions'}, :skip => :registration

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'dashboard/index', as: :root
      end
    end
  end

  namespace :admins do
    resources :kudos
  end
  
  resources :kudos

  root to: "kudos#index"
end
