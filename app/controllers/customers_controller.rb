class CustomersController < ApplicationController
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
end
