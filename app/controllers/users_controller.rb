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

end
