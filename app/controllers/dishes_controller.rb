class DishesController < ApplicationController
  def index
    @dishes = Dish.order(:id).search(params[:search])
    if session[:box_id] != nil
      @len = session[:box_id].size
      if BoxDish.where(box_id: session[:box_id][@len - 1]).count == 0
        session[:capamax] = false
      end
    end
  end

  def new
    @dish = Dish.new
  end
  
  def create
    @dish = Dish.new(params[:dish])
    if @dish.save
      redirect_to :dishes, notice: "登録しました"
    else
      redirect_to 'index'
    end
  end

  def select
    @len = session[:box_id].size
    @box = Box.find(session[:box_id][@len - 1])
    @dish = Dish.find(params[:id])
    @dish.boxes << @box
    @dishcnt = BoxDish.where(box_id: session[:box_id][@len - 1]).count
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
    @len = session[:box_id].size
    @dish = Dish.find(params[:id])
    @dish.boxes.destroy(Box.find(session[:box_id][@len - 1]))
    redirect_to controller: 'dishes' , action: 'index'
  end

  def selected
    if session[:box_id] != nil
    @len = session[:box_id].size
    @box = Box.find(session[:box_id][@len - 1])
    @boxarr = []
    session[:box_id].each do |s|
      @boxarr << Box.find(s)
    end
    @selectdishes = []
    @boxarr.each do |b|
      @selectdishes << b.dishes 
    end
    else
      @selectdishes = nil   
    end
  end
 
  def stop
  end
end
