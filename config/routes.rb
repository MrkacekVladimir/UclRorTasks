Rails.application.routes.draw do

  root to: "home#index"

  get 'settings', to: 'signed_in/settings#index'
  get 'dashboard', to: 'signed_in/dashboard#index'

  scope module: "signed_in" do
    resources :tasks
    namespace :settings do
      resources :tags, :categories
    end
  end



  devise_for :users, controllers: {
      registrations: "users/registrations"
  }
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
