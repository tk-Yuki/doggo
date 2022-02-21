class PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @user = current_user
    @post = Post.new
    @place = Place.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
    @post = Pist.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:image, :body, :place_id)
  end

  def user_params
    params.require(:user).permit(:profile_iamge, :name)
  end

end
