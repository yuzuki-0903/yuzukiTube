Rails.application.routes.draw do
	root "videos#index"
	devise_for :users
	devise_for :admins, controllers: {
		registrations: 'admins/registrations',
		sessions: 'admins/sessions'
	}
	namespace :admin do
		resources :videos, controller: '/videos',only: [:index]
	end
	get 'video/categorys'
	get '/cancel' => 'users#cancel',as: 'cancel'
	patch 'users/:id/retire' => 'users#is_quit',as: 'user_retire'
	# get 'user_logout' => 'de'
	resources :favorites, only: [:create, :destory]
	get 'videos/about'
# HTTPメソッド "URL" => 'アクション名#コントローラ名'

 devise_scope :user do
    # get 'users/signuplist' => 'users/registrations#signuplist'
	get '/retire_logout' => 'devise/sessions#destroy', as: 'retire_logout'
    
    # ↓な気もしますのでrails routesコマンドなどで確認してください
    # get 'signuplist' => 'users/registrations#signuplist'
  end
# index, new, create, destory, update edit =>これら６つはresources

	resources :users, :create_categories, :chats, :admins, :video_categories, :videos
	 mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
