Rails.application.routes.draw do
  devise_for :users, :controller=>{registrations: "registrations"}
  resources :events
  resources :invitations

  root"events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
