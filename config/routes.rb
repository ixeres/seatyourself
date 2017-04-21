Rails.application.routes.draw do

  get 'users/new'

  get 'users/edit'

  get 'users/update'

  get 'users/delete'

  resources :users

  resources :restaurants

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
