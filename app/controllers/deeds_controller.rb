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
    deed = Deed.new deed_params
    user = User.find_by(id: current_user.id)
    user_karma = user.karma
    deed_karma = deed.karma
    if user_karma >= deed_karma && deed.save
      Order.create(deed_id: deed.id, user_id: current_user.id, karma: deed_karma)
      user.update_attribute(:karma, user_karma - deed_karma)
      redirect_to deed
    else
      flash.now[:danger] = 'Invalid karma available and/or deed details'
      redirect_to new_deed_path
    end
  end

  def edit
    @deed = Deed.find params[:id]
  end

  def update
    # check karma point available
    deed = Deed.find params[:id]
    deed.update deed_params
    redirect_to deed
  end

  def show
    @deed = Deed.find params[:id]
  end

  def destroy
    user = User.find_by(id: current_user.id)
    deed = Deed.find params[:id]
    order = Order.find_by(deed_id: deed.id)
    if user.id == order.user_id
      user.update_attribute(:karma, user.karma + order.karma)
      deed.destroy
      order.destroy
      redirect_to user_path(user)
    else
      redirect_to deed
    end
  end

  def accept
    
  end

  private
  def deed_params
    params.require(:deed).permit(:title, :description, :postcode, :date, :image, :karma, :deed_type)
  end
end
