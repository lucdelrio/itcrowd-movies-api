Rails.application.routes.draw do
  root to: redirect('/admin')
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :movies
      resources :people
    end
  end
end