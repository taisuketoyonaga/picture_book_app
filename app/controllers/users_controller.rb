class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :search_content, only: [:show, :search]

  def show
    user = User.find(params[:id])
    @content = user.contents    
  end

  def search
    @content = @q.result
  end

  private
  def search_content
    @q = Content.ransack(params[:q])
  end

end
