class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.karma = 10
    if @user.save
      log_in @user
      flash.now[:success] = "Welcome to Karmaconomy"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
       flash.now[:success] = "Profile updated"
       redirect_to @user
     else
       render 'edit'
     end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to :controller => 'welcome', :action => 'index'
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :postcode, :biography, :image, :email, :password,
    :password_confirmation)
  end

  def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end

   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless @user == current_user
   end
end
