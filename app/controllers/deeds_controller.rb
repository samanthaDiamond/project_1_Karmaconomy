class DeedsController < ApplicationController
  def index
    @deeds = Deed.all
  end

  def new
    @deed = Deed.new
  end

  def create
    deed = Deed.create deed_params
    redirect_to deed
  end

  def edit
    @deed = Deed.find params[:id]
  end

  def update
    deed = Deed.find params[:id]
    deed.update deed_params
    redirect_to deed
  end

  def show
    @deed = Deed.find params[:id]
  end

  def destroy
    deed = Deed.find params[:id]
    deed.destroy
    redirect_to :controller => 'welcome', :action => 'index'
  end

  private
  def deed_params
    params.require(:deed).permit(:title, :description, :postcode, :date, :image, :karma, :deed_type)
  end
end
