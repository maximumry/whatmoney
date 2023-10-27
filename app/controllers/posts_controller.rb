class PostsController < ApplicationController
  def index
    @posts = Post.preload(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
    # if post.valid?
    #   post.save
    #   redirect_to root_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private
  def post_params
    params.require(:post).permit(:asset, :text).merge(user_id: current_user.id)
  end
end
