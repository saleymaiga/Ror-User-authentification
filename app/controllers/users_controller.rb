class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  	   flash[:notice] = "Your account was created successfully"
  	   redirect_to user_path(@user)
  	else
  	   flash[:alert] = "There was  problem creating your account"
  	   redirect_to :back
 	
  	end
  	
  end

  def edit
  end

  def show
  end

  private


  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  	
  end
end
