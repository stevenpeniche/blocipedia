Rails.application.routes.draw do
  root 'welcome#index'

  get 'users/index'

	devise_for :users

	mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
