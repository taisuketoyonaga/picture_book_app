class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :search_content, only: [:index, :show, :search]
  before_action :set_params, only: [:edit, :update, :show, :destroy]
  def index
    @content = Content.where(user_id: current_user.id).order(created_at: 'DESC')
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.create(content_parameter)
    if @content.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    redirect_to user_path(id: params[:id]) if @content.update(content_parameter)
  end

  def search
    @content = @q.result
  end

  def destroy
    if @content.destroy
      redirect_to users_path(id: current_user.id)
    else
      render :show
    end
  end

  private

  def content_parameter
    params.require(:content).permit(:image, :name, :kind_id, :place, :date, :memo).merge(user_id: current_user.id)
  end

  def search_content
    content = Content.where(user_id: current_user.id)
    @q = content.ransack(params[:q])
  end

  def set_params
    @content = Content.find(params[:id])
  end
end
