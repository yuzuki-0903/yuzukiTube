class Video < ApplicationRecord
	has_many :chats
	has_many :favorites
	belongs_to :user
	has_many :video_categorys
	mount_uploader :video, VideoUploader

	def favorited_by?(user)
		# binding.pry
		favorites.where(user_id: user.id).exists?
	end
end
