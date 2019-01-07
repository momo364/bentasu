class CustomersController < ApplicationController
  def index
   @customers = Customer.all
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      redirect_to controller: 'customers', action: 'login',notice: "登録完了しました"
    else
      render "new"
    end 
  end

  def new 
    @customer = Customer.new(name: "")
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.assign_attributes(params[:customer])
    if @customer.save
      redirect_to controller: 'customers',action: 'history' , notice: "更新しました。"
    else
      redirect_to "edit"
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to :customers, notice: "会員を削除しました"
  end

  def history
    @histories = Order.where(customer_id:current_customer.id)
  end
end
