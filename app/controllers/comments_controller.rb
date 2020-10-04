class CommentsController < ApplicationController

  def new
    @comment = Comment.new    
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
