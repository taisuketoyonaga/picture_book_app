class ContentsController < ApplicationController
   before_action :set_params, only: :show

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


private
  
  def content_parameter
    params.permit(:id, :image, :name, :kind_id, :place, :date, :memo).merge(user_id: current_user.id)
  end

  def set_params
    @content = Content.find(params[:id])
  end
end
