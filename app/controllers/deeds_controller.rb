class DeedsController < ApplicationController
  def index
    @deeds = Deed.all
    @categories = Category.all
  end

  def new
    if logged_in?
      @deed = Deed.new
      @categories = Category.all
      @categories_list = []
      @categories.each do |c|
        @categories_list.push(c.title)
      end
    else
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

  def create
    @deed = Deed.new deed_params

    if params[:file]
      req = Cloudinary::Uploader.upload params[:file]
      @deed.image = req["url"]
    end

    user = User.find_by(id: @current_user.id)
    user_karma = user.karma
    deed_karma = @deed.karma
    if @deed.save && user_karma >= deed_karma
      Order.create(deed_id: @deed.id, user_id: current_user.id, karma: deed_karma, accept_id: -1, complete: false)
      user.update_attribute(:karma, user_karma - deed_karma)
      redirect_to @deed
    else
      flash.now[:danger] = 'Invalid karma available and/or deed details'
      redirect_to new_deed_path
    end
  end

  def edit
    @deed = Deed.find params[:id]
    @categories = Category.all
  end

  def update
    deed = Deed.find params[:id]

    if params[:file]
      req = Cloudinary::Uploader.upload params[:file]
    deed.image = req["url"]
    end

    user = User.find_by(id: current_user.id)
    user_karma = user.karma + deed.karma
    new_deed_karma = deed_params["karma"].to_i
    if user_karma >= new_deed_karma
      user.update_attribute(:karma, user_karma-new_deed_karma)
      deed.update deed_params
      redirect_to deed
    else
      flash.now[:danger] = "Sorry, insufficient karma available."
      redirect_to deeds_path(deed)
    end
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
    @deed = Deed.find params[:id]
  end

  def accepted
    deed = Deed.find params[:id]
    order = Order.find_by(deed_id: deed.id)
    order.update_attribute(:accept_id, current_user.id)
    redirect_to deed
  end

  def complete
    @deed = Deed.find params[:id]
  end

  def completed
    deed = Deed.find params[:id]
    order = Order.find_by(deed_id: deed.id)
    order.update_attribute(:complete, true)
    user_accepted = User.find_by(id: order.accept_id)
    user_accepted.update_attribute(:karma, user_accepted.karma + order.karma)
    redirect_to deed
  end

  private
  def deed_params
    params.require(:deed).permit(:title, :description, :postcode, :date, :image, :karma, :category_id)
  end
end
