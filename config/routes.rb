Rails.application.routes.draw do
  root to: redirect('/admin')
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for "User", at: 'api/v1/users', skip: [:omniauth_callbacks]

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :movies, only: [:index, :create, :show, :update]
      resources :people, only: [:index, :create, :show, :update]
    end
  end
end
