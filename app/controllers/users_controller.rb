class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user)
	end


	def is_quit
		@user = User.find(params[:id])
		@user.is_quit = true
		if @user.update(video_params)
			redirect_to user_path(@user)
		else
			render :show
		end

	end

	def cancel
		@user = current_user
	end
	private
	def video_params
	    params.require(:user).permit(:password)
	   # paramsに渡してあげる。
	   #params.require(:モデル名).permit(:カラム名)
	end	

end