class FavoritesController < ApplicationController
 
def create
        video = Video.find(params[:video_id])
        favorite = current_user.favorites.new(video_id: video.id)
        # binding.pry
        favorite.save
        redirect_to video_path(video.id)
    end
    def destroy
        video = video.find(params[:video_id])
        favorite = current_user.favorites.find_by(video_id: video.id)
        favorite.destroy
        redirect_to video_path(params[:video_id])
    end
end
