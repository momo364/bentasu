class SaleManagementsController < ApplicationController
  def edit
    @dish = Dish.find(params[:id])
    @sale = SaleManagement.where(dish_id:@dish.id)
  end

  def update
    @sale = SaleManagent.find(params[:id])
    @sale.assign_attributes(params[:sale_management])
    if @sale.save
      redirect_to :dish, notice: "予定数を変更しました"
    else
      render 'edit'
    end
  end
 
  def index
    @sale = SaleManagement.all
  end
end
