class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def new
    @comment = current_user.comments.build
    @post = Post.find(params[:post_id])
  end
  
  def edit
  end

  def update
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_content).merge(post_id: params[:post_id])
    end
end