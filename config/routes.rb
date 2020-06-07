Rails.application.routes.draw do

  resources :pnjs
  #devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  get 'registered' => 'pnjs#registered'
  devise_for :users, :controllers => { registrations: 'registrations' }
  post 'myemail/:studentid' => 'pnjs#myemail', as: :myemail
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
