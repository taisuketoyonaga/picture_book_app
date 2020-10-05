class CommentsController < ApplicationController
  def index
    @content = Content.find(params[:content_id])
    @comments = @content.comments.includes(:user).order(created_at: "DESC")
  end
  def create
    comment = Comment.create(comment_params)
    render json:{post: comment }
  
  end

 private

  def comment_params
    params.permit(:comment, :content_id).merge(user_id: current_user.id)
  end
  
end
