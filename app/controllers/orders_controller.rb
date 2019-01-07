class OrdersController < ApplicationController
  def create
    @len = session[:box_id].size
    @order = Order.new(customer_id: current_customer.id, status: false, time: DateTime.now)
    if @order.save
      0.upto(@len - 1) do |i|
        @box = Box.find(session[:box_id][i])
        @box.order_id = @order.id
        @box.save
      end
      session.delete(:box_id)
      session.delete(:capamax)
      session.delete(:box_kind_id)
      redirect_to controller: 'orders' ,action: 'complete'
    else
      redirect_to controller: 'dishes', action: 'selected'
    end
  end 
  
  def index
    @orders = Order.all.order(id:"DESC")
  end

  def kitchen_index
    @orders = Order.where 
  end
end
