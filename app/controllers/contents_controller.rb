class ContentsController < ApplicationController
   before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
     @content = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content =  Content.create(content_parameter)
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
    if @content.update(content_parameter)
      redirect_to content_path
    else
      render :edit
    end
  end

  def destroy

    if @content.destroy
      redirect_to user_path(id: current_user.id)
    else
      render :show
    end

  end


private
  
  def content_parameter
    params.require(:content).permit(:image, :name, :kind_id, :place, :date, :memo).merge(user_id: current_user.id)
  end

  def set_params
    @content = Content.find(params[:id])
  end
end
