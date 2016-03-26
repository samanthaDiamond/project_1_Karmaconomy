class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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
    user = User.find params[:id]
    user.update user_params
    redirect_to user
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
end
