class AdminsController < ApplicationController
def index
	redirect_to user_path(@user)
	end

end
