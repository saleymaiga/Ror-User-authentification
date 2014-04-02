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
  end
  	
  end

  def destroy
  	
  end





end
