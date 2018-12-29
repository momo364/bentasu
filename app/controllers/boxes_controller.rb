class BoxesController < ApplicationController
  def create
    @box = Box.new(params[:box])
    session[:box_kind_id] = @box.box_kind_id
    if @box
      redirect_to controller: 'dishes', action: 'index'
    else
      redirect_to controller: 'box_kinds', action: 'index'
    end
  end  
end
