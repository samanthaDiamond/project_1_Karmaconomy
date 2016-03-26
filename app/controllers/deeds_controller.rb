class DeedsController < ApplicationController
  def index
    @deeds = Deed.all
  end

  def new
    if logged_in?
      @deed = Deed.new
    else
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

  def create
    deed = Deed.create deed_params
    Order.create(deed_id: deed.id, user_id: current_user.id, karma: deed.karma)
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
