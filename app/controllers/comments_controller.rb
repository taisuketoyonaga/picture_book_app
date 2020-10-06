class CommentsController < ApplicationController
  def index
    @content = Content.find(params[:content_id])
    @comments = @content.comments.includes(:user).order(created_at: "DESC")
  end

  def create
    comment = Comment.create(comment_params)
    render json:{post: comment }
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to content_comments_path(content_id:params[:content_id])
    end
  end

 private

  def comment_params
    params.permit(:comment, :content_id).merge(user_id: current_user.id)
  end
  
end
