module DeedsHelper

  def get_order_status(order)
    if order.accept_id == -1
      status = "Available"
    elsif order.accept_id > 0 && !order.complete
      status = "Accepted"
    else
      status = "Completed"
    end
  end

  def deed_belongs_to_logged_in_user?(deed)
    order = Order.find_by(deed_id: deed.id)
    order.user_id == current_user.id
  end
  
end
