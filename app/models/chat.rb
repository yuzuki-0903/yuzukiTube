class Chat < ApplicationRecord
	belongs_to :videos
	belongs_to :users
end
