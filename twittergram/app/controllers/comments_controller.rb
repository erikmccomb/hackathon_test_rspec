class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def show
  end

  def new
    @comment = @post.comments.new
    render partial: 'form'
  end

  def edit
    render partial: 'form'
  end

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to [@post, @comment]
    else
      render partial: 'form'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@post, @comment]
    else
      render partial: 'form'
    end
  end

  def destroy
    @comment.destory
    redirect_to post_comments_path(@post)

  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:message, :user_id, :post_id)
end
