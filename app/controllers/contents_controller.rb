class ContentsController < ApplicationController


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

private
  
  def content_parameter
    params.require(:content).permit(:image, :name, :kind_id, :place, :date, :memo).merge(user_id: current_user.id)
  end

  def set_params
    @content = Content.find(params.id)
  end
end
