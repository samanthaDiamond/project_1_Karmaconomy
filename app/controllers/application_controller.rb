class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # before_action :fetch_user #get current user before anything
  #
  # private
  # def fetch_user
  #   @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
  #   session[:user_id] = nil unless @current_user.present?
  # end
end
