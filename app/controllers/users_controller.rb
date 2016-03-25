class UsersController < ApplicationController
  def index
    @user = User.first
  end

  def new
    @user = User.new
  end

  def create
    user = User.create user_params
    redirect_to user
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to :controller => 'welcome', :action => 'index'
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :postcode, :biography, :image, :karma)
  end
end
