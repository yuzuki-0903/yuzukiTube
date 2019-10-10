class Favorite < ApplicationRecord
	belongs_to :videos
	belongs_to :users
	

end
