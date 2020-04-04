Rails.application.routes.draw do

  get 'commitments/new'
  get 'commitments/create'
  get 'commitments/destroy'

  get 'sentences/new'
  get 'sentences/create'
  get 'sentences/destroy'

  get 'groups/:id/court', to: 'groups#court', as: :court
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/create'
  get 'groups/edit'
  get 'groups/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :groups
end
