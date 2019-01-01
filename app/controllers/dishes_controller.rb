class DishesController < ApplicationController
  def index
    @dishes = Dish.order(:id)
    if BoxDish.where(box_id: session[:box_id]).count == 0
      session[:capamax] = false
    end
  end

  def select
    @box = Box.find(session[:box_id])
    @dish = Dish.find(params[:id])
    @dish.boxes << @box
    @dishcnt = BoxDish.where(box_id: session[:box_id]).count
    @boxkind = BoxKind.find(session[:box_kind_id])
    @boxcapa = @boxkind.capacity
    if @dishcnt >= @boxcapa
      session[:capamax] = true
    else
      session[:capamax] = false
    end 
    redirect_to controller: 'dishes', action: 'index' 
  end

  def unselect
    @dish = Dish.find(params[:id])
    @dish.boxes.destroy(Box.find(session[:box_id]))
    redirect_to controller: 'dishes' , action: 'index'
  end

  def selected
    @box = Box.find(session[:box_id])
    @selectdishes = @box.dishes 
  end
end
