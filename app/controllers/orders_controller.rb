class OrdersController < ApplicationController
  def create
    @len = session[:box_id].size
    @order = Order.new(customer_id: current_customer.id, status: false, time: DateTime.now)
    if @order.save
      0.upto(@len - 1) do |i|
        @box = Box.find(session[:box_id][i])
        @box.order_id = @order.id
        @box.save
        @boxdish = BoxDish.where(box_id:@box.id)
        @boxdish.each do |boxdish|
          @sale = SaleManagement.where(dish_id:boxdish.dish_id).last
          @orderednum = @sale.ordered_number
          @orderednum = @orderednum + 1
          @sale.ordered_number = @orderednum
          @sale.save
        end
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
    if current_customer.present?
      @orders = Order.where(customer_id:current_customer.id)
    else
      @orders = Order.all.order(id:"DESC")
    end
    @orders
  end

  def kitchen_index
    @orders = Order.where(status: false)
  end

  def complete
    @dcount = []
    @order = Order.find(params[:id])
    @order.status = true
    @order.save
    @boxes = Box.where(order_id:@order.id)
    @boxes.each do |box|       
      @dishes = BoxDish.where(box_id:box.id)
      @dishes.each do |dish|
        if @dcount[dish.id] == nil
          @dcount[dish.id] = 1
        else
          @dcount[dish.id] = @dcount[dish.id] + 1
        end
      end
    end
    @len = @dcount.size
    1.upto(@len-1) do |i|
      @dish = Dish.find(i)
      @sale = SaleManagement.where(dish_id:@dish.id).last
      if (@sale.made_number - @sale.sold_number) >= @dcount[i]
        @sale.sold_number = @sale.sold_number + @dcount[i]
        @sale.save
      else
        redirect_to controller: 'orders', action: 'kitchen_index'
    end
  end
end
