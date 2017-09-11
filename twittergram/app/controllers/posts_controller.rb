class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :edit, :destroy]
  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:success] = "Posted Successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to post"
      render partial: "form"
    end
  end


  def update
    if @post.update(post_params)
      flash[:success] = "Updated Post Successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to update post!"
      render partial: "form"
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to posts_path
  end

  private

    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end