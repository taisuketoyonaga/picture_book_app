Rails.application.routes.draw do
  devise_for :users
  resources :contents  do
   collection do
    get 'search'
   end
  end
  resources :users, only: :show

  root to: "contents#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
