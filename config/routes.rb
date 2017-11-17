Rails.application.routes.draw do
  resources :subscription, only: [:update]

  resources :charges, only: [:new, :create]

  resources :wikis

  root 'welcome#index'

  get 'users/index'

	devise_for :users

	mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
