class Admins::SwitchUserController < ApplicationController

	def index
    @user_list = User.all
  end
 
end