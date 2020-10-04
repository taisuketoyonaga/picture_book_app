class CommentsController < ApplicationController

  def index
    @content = Content.find(params[:content_id])
    @comments = @content.comments.includes(:user)
   # binding.pry
  end
  def create
    comment = Comment.create(comment_params)
    if content.save
      redirect_to content_comment_path(content_id:id)
    end
  end

private

  def comment_params
    params.permit(:comment, :content_id).merge(user_id: current_user.id)
  end
  
end
