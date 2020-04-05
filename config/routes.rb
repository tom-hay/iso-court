Rails.application.routes.draw do

  root to: "groups#index"

  get 'groups/:id/court', to: 'groups#court', as: :court

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups do
    resources :charges, only: [:new, :create, :destroy] do
      resources :sentences, only: [:new, :create]
    end
  end

  # get 'charges/destroy'
  # get 'sentences/destroy'

  # Current_user will commit
  get 'commitments/new'
  get 'commitments/create'
  get 'commitments/destroy'
end
