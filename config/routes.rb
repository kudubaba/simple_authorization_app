Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update]

  root 'sessions#new'

  get   '/login'  =>  'sessions#new',     as: 'login'
  post  '/login'  =>   'sessions#create'
  get   '/logout' =>  'sessions#destroy', as: 'logout'
end
