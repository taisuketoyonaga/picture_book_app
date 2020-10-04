class CommentsController < ApplicationController

  def index
    @content = Content.find(params[:content_id])
    @comments = Comment.includes(:user)
  end
  def create
    comments = Comment.create(comment_params)
    if comment.save
      redirect_to content_path(comment.content.id)
    else
      render :new
    end
  end

private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
  
end
