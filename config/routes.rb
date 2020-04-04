Rails.application.routes.draw do
  get 'sentences/new'
  get 'sentences/create'
  get 'sentences/destroy'
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
