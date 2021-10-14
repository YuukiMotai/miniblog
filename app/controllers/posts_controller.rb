class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.all
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
     redirect_to new_post_path
    else
     render :new
    end
  end

  def new
   @post = Post.new
   @posts = Post.all
  end

  private
  def post_params
   params.require(:post).permit(:title, :body)
  end
end
