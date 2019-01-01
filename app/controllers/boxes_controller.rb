class BoxesController < ApplicationController
  def create
    @box = Box.new(params[:box])
    session[:box_kind_id] = @box.box_kind_id
 #   session[:box_id] = @box.id
    if @box.save
      redirect_to controller: 'dishes', action: 'index'
    else
      redirect_to controller: 'box_kinds', action: 'index'
    end
    @box = Box.order(:id).last
    session[:box_id] = @box.id
  end  
end
