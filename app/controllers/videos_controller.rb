class VideosController < ApplicationController
	before_action :authenticate_user_or_admin, only:[:index]

	PER = 9
	def index
		if current_user && current_user.is_quit == true
			redirect_to retire_logout_path
		end
		 @new_video = Video.new
		 # @videos = Video.page(params[:page]).per(9)
	# 	 @q = current_user.videos.ransack(params.[:q])
		 @videos = Video.all.order('id ASC').page(params[:page]).per(9)
		
	end

	def new
	   
	end
	def destroy
		@video=Video.find(params[:id])
		@video.destroy
		redirect_to videos_path
	end
	def about
	   
	end

	def show
	    @video = Video.find(params[:id])
		@chat = @video.chats.limit(10).order('created_at desc')
	end

	def create
	    @video = Video.new(video_params)
	    @video.user_id = current_user.id

	    @video.save
	end

	private
	def video_params
	    params.require(:video).permit(:video, :video_content)
	   # paramsに渡してあげる。
	   #params.require(:モデル名).permit(:カラム名)
	end	

	def authenticate_user_or_admin
		if user_signed_in? or admin_signed_in?
			# ok
		else
    		authenticate_user!
		end
	end
end
