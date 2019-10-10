class VideoCategory < ApplicationRecord
	has_many :videos
	has_many :categorys
	
end
