Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :skip => [:registrations, :passwords], :path => "", :controllers => { :sessions => "users/sessions"} do
    
  end

  namespace :api do
  	authenticated :user do
	  	post 'users/log_in' => 'users#log_in'
	    resources :users
		end

  end



end
