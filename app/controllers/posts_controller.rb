class PostsController < ApplicationController
  def index
  	@post = Post.all
  		
  end	


  def new
  	@post = Post.new
  	@user = User.find(params[:user_id])
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = params[:user_id]
  	if @post.save
  	   flash[:notice] = "Your post was created successfully"
  	   redirect_to user_posts_path
  	else
  	   flash[:notice] = "There was a problem creating your post"
  	   redirect_to :back
  	end
	
  end


  private

  def post_params
  	params.require(:post).permit(:title, :content)
  		
  end


end
