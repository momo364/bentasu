class DishesController < ApplicationController
  def index
    @dishes = Dish.order(:id)
  end

  def select
    @box = Box.find(session[:box_id])
    @dish = Dish.find(params[:id])
    @dish.boxes << @box
    
    redirect_to controller: 'dishes', action: 'index' 
  end
end
