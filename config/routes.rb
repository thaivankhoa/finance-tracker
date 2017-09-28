Rails.application.routes.draw do
  resources :user_stocks, except: [:show,:edit,:update]
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'welcome#index'
  root 'welcome#index'

  resources :friendships
  resources :users, only: [:show]

  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: "stocks#search"
  get 'my_friends', to: "users#my_friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
  delete 'remove_friend', to: "users#remove_friend"
  controller :welcome do

  end
end
