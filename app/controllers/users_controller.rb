class UsersController < ApplicationController
	before_filter :set_user, :only => [:show, :edit, :update, :destroy]



	def edit
	end

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

	def update
    		respond_to do |format|
        	  if @user.update_attributes(params[:post])
        		flash[:notice] = 'User successfully updated'
        		format.html { redirect_to(@user) }
        		format.xml { head :ok }
      		  else
        		format.html { render :action => "edit" }
        		format.xml { render :xml => @user.errors,
                     			:status => :unprocessable_entity }
      		  end
    	    end
  	end


        def destroy
                @review.destroy

                respond_to do |format|
                  format.html { redirect_to(users_url) }
                  format.xml {head :ok }
                end
        end

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:nickname, :password, :description)
	end


end
