Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  resources "talks"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
