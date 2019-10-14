Rails.application.routes.draw do
	root "videos#index"
	devise_for :users
	devise_for :admins, controllers: {
		registrations: 'admins/registrations',
		sessions: 'admins/sessions'
	}
	get 'video/categorys'
	get 'users/:id/cancel' => 'users#cancel'
	put 'users/:id/is_quit' => 'users#is_quit'
	# get 'user_logout' => 'de'
	resources :favorites, only: [:create, :destory]
	get 'videos/about'
# HTTPメソッド "URL" => 'アクション名#コントローラ名'

# index, new, create, destory, update edit =>これら６つはresources

	resources :users, :create_categories, :chats, :admins, :video_categories, :videos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
