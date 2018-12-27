class SessionsController < ApplicationController
  def create
    worker = Worker.authenticate(params[:username],params[:password])
    if worker
      session[:worker_id] = worker.id
    else
      flash.alert = "ユーザ名とパスワードが一致しません"
    end
    redirect_to controller: 'workers', action: 'login' 
  end

  def destroy
    session.delete(:worker_id)
    redirect_to :root
  end
end
