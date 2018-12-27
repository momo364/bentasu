class SessionCustomersController < ApplicationController
  def create
    customer = Customer.authenticate(params[:username],params[:password])
    if customer 
      session[:customer_id] = customer.id
    else
      flash.alert = "ユーザ名とパスワードが一致しません"
    end
    redirect_to controller: 'customers',action: 'login' 
  end

  def destroy
    session.delete(:customer_id)
    redirect_to :root
  end
end
