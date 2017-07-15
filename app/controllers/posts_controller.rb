class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:success] = 'Post are succefully created'
        redirect_to post_path(@post)
      else
        render 'new'
      end
  end

  def show

  end

  def edit

  end

  def update
      if @post.update(post_params)
        flash[:success] = 'Post are succefully updated'
        redirect_to post_path(@post)
      else
        render 'edit'
      end
  end

  def destroy
    @post.destroy
    flash[:danger] = 'post succefully deleted'
    redirect_to posts_path(@post)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end

end