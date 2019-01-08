class SaleManagementsController < ApplicationController
  def edit
    @dish = Dish.find(params[:dish_id])
    @sale = @dish.sale_management 
  end

  def update
    @sale = SaleManagement.find(params[:id])
    @sale.assign_attributes(params[:sale_management])
    if @sale.save
      redirect_to :sale_managements, notice: "予定数を変更しました"
    else
      render 'edit'
    end
  end
 
  def index
    @sale = SaleManagement.all
  end
end
