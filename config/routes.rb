Rails.application.routes.draw do
  devise_for :admins, path: 'admins',
  controllers: {sessions: "admins/sessions",
                masquerades: "admins/masquerades"}
  devise_for :users, path: 'users',
  controllers: {sessions: "users/sessions"}


  
  # Authenticated route to show specific Dashboard for users
  authenticated :admin do 
  	root to: 'public#adminpage', as: "authenticated_admin" 
  end
  


  # Authenticated route to show specific Dashboard for users
  authenticated :user do 
  	root to: 'public#userpage', as: "authenticated_user" 
  end

  # Routes that verifies authentication 
  authenticate :admin do 
  	namespace :admins do 
  		get '/switch_user', to: "switch_user#index"
  	end
  end

  #Root of the main langing page
  root to: 'public#main'

  
end
