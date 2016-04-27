class CategoriesController < ApplicationController
  before_action :authorise, :only => [:new, :index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
    @deeds = @category.deeds
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_path
  end

private

  def category_params
    params.require(:category).permit(:title)
  end

  def authorise
    redirect_to root_path unless (@current_user.present? && @current_user.admin?)
  end
end
