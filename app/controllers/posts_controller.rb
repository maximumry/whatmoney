class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_match, only: :edit
  def index
    @posts = Post.preload(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def post_params
    params.require(:post).permit(:asset, :text, :image).merge(user_id: current_user.id)
  end
  
  def user_match
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to root_path
    end
  end
end
