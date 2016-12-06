Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :skip => [:registrations, :passwords], :path => "", :controllers => { :sessions => "users/sessions"} do
    
  end

  namespace :api do
    resources :users

  end



end
