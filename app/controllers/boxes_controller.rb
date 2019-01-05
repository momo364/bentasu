class BoxesController < ApplicationController
  def create
    @box = Box.new(params[:box])
    session[:box_kind_id] = @box.box_kind_id
    if @box.save
      redirect_to controller: 'dishes', action: 'index'
    else
      redirect_to controller: 'box_kinds', action: 'index'
    end
    @box = Box.order(:id).last
    if session[:box_id] == nil
      session[:box_id] ||= []
    end
    session[:box_id] << @box.id
  end  
end
