class OrdersController < ApplicationController
  def new
    # when new deed created transfer users associated karma points to 'karma' provided adequate karma available in their name
    #redirect_to :controller => 'deeds', :action => 'show'
  end

  def edit
    # if deed edited and 'karma' value changed run same method as new
  end

  def create
    # needed given new method
  end

  def update
    # ? needed given edit method
  end

  def delete
    #  once both users 'accept' karma transfer, transfer karma from 'karma' to user2. Then delete deed from database
    # if user1 deletes deed prior to deed being fulfilled, transfer karma from 'karma' back to user1 prior to delete
  end

end
