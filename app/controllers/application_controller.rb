class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :set_search


def after_sign_in_path_for(resource)
	case resource
	when User
		videos_path
	when Admin
		admin_videos_path
	end
end


	def set_search
		  @q = Video.ransack(params[:q])
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :name, :family_kana, :first_kana, :email, :password])
  
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) 
   

    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :is_quit,:password])
	end
end
