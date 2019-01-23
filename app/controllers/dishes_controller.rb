class DishesController < ApplicationController
  def index
    @q = Dish.ransack(params[:q])
    if current_worker.present?
      @dishes = @q.result.includes(:allergies)
    else
      @dishes = @q.result.includes(:allergies).where(potential:true)
    end
    if session[:box_id] != nil
      @len = session[:box_id].size
      if BoxDish.where(box_id: session[:box_id][@len - 1]).count == 0
        session[:capamax] = false
      end
    end
    @dish = Dish.new
    @dish.allergy_dishes.build
    @dish.build_sale_management
    
  end
  
  def index_noselect
   
      @dishes = Dish.order(:id).where(potential:true)
  end

  def new
    @dish = Dish.new
    @dish.allergy_dishes.build
  end
  
  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to :dishes, notice: "登録しました"
    else
      redirect_to 'index'
    end
  end

  def dish_params
    params.require(:dish).permit(:name,:price,:calorie,{:allergy_ids => []},:category,:potential)
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
    @dish = Dish.find(params[:id])
    @dish.potential = false
    if @dish.save
      redirect_to :dishes, notice: "生産ストップしました"
    else
      render 'index'
    end 
  end

  def start
    @dish = Dish.find(params[:id])
    @dish.potential = true 
    if @dish.save
      redirect_to :dishes, notice: "生産再開しました"
    else
      render 'index'
    end 
  end 

  def search
    @q = Dish.search(search_params)
    @dishes = @q.result(distinct:true)
    render "index"
  end

  def search_params
    params.require(:q).permit!
  end
end
