class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(params[:worker])
    if @worker.save
      redirect_to ({controller: 'workers', action: 'index' }),notice: "登録しました"
    else
      render "new"
    end
  end
end
