class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
    	   @user = User.new(user_params)
             if @user.save
        	redirect_to @user, notice: "Saved user"
      		else
        	render action: 'new'
           end
        end

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:nickname, :password, :description)
	end


end
