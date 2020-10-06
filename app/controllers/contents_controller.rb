class ContentsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :search_content, only: [:index, :show, :search]
  def index
    @content = Content.all.order(created_at:'DESC')
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.create(content_parameter)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
     @content.update(content_parameter)
      redirect_to content_path(id: params[:id])
  end

  def destroy
    if @content.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @content = @q.result
  end

  private

  def content_parameter
    params.require(:content).permit(:image, :name, :kind_id, :place, :date, :memo).merge(user_id: current_user.id)
  end

  def set_params
    @content = Content.find(params[:id])
  end

  def search_content
    @q = Content.ransack(params[:q])
  end
end
