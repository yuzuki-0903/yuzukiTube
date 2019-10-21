class FavoritesController < ApplicationController
 
def create
        video = Video.find(params[:video_id])
        favorites = current_user.favorites.new(video_id: video.id)
        # binding.pry
        favorites.save
        redirect_to video_path(video.id)
    end
    def destroy
        video = Video.find(params[:video_id])
        favorites = current_user.favorites.find_by(video_id: video.id)
        favorites.destroy
        redirect_to video_path(params[:video_id])
    end
end
