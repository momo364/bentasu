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
#    @dish.sale_management.build
    @dish.build_dish_image
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "index"
    end
  end

  def show
    @dish = Dish.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "index"
    end
  end
  
  def destroy
    @box = Box.find(params[:id])
    @size = session[:box_id].size
    1.upto(@size - 1) do |i|
      if session[:box_id][i] == @box.id
        session[:box_id].delete(@box.id)
      end
    end
    redirect_to selected_dishes_path,notice:"削除しました"
  end  

  def index_noselect
      @dishes = Dish.order(:id).where(potential:true)
  end

  def new
    @dish = Dish.new
#    @dish.allergy_dishes.build
#    @dish.sale_management.build
  end
  
  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      @sale = SaleManagement.new
      @dish.sale_management = @sale
      redirect_to :dishes, notice: "登録しました"
    else
      redirect_to 'index'
    end
  end

  def dish_params
    params.require(:dish).permit(:name,:price,:calorie,{:allergy_ids => []},:category,:potential,image_atributes: [:destroy,:id,:uploaded_image])
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
    if @len == 0
      @selectdishes = nil and return
    end
    #@box = Box.find(session[:box_id][@len - 1])
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

  private
  # 画像送信
  def send_image
    if @dish.dish_image.present?
      send_data @dish.dish_image.data,
        type: @dish.dish_image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end
