class DishesController < ApplicationController
  def index
    @dishes = Dish.order("name")
  end
end
