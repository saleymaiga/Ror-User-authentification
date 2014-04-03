class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.authenticate(params[:email], params[:password])
	  if @user
	  	session[:user_id] = @user.id
	  	flash[:notice] = "welcome #{@user.email}"

	  	redirect_to user_path(@user)
	  else
	  	flash[:alert] = "There was a problem signing you in"
	  	redirect_to :back
	  end
  	
  end

  def destroy
	  session[:user_id] = nil
	  flash[:alert] = "your are logged out successfully"
	  redirect_to root_path	
  end



end
