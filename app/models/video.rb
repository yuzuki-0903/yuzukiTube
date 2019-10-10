class Video < ApplicationRecord
	has_many :chats
	has_many :favorites
	belongs_to :user
	has_many :video_categorys
	mount_uploader :video, VideoUploader
end
