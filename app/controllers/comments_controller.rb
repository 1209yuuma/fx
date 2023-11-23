class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
     respond_to do |format|
      format.turbo_stream
    end
  end

  def new
    @comment = Comment.new
    @comment = current_user.comments.build
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(post_id: params[:post_id])
    end
end