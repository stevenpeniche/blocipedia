Rails.application.routes.draw do
  resources :subscription, only: [:update]

  resources :charges, only: [:new, :create]

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  get 'users/index'

	devise_for :users

	get 'blocipedia' => 'welcome#index'

	authenticated :user do
		root 'wikis#index', as: :authenticated_root
	end

	root 'welcome#index'

	mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
