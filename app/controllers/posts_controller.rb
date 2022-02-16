class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:image, :body)
  end

  def user_params
    params.require(:user).permit(:profile_iamge, :name)
  end

end
