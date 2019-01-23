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

  def destroy
    @box = Box.find(params[:id])
    @size = session[:box_id].size
    0.upto(@size - 1) do |i|
      if session[:box_id][i] == @box.id
        session[:box_id].delete(@box.id)
      end
    end
    redirect_to selected_dishes_path,notice:"#{session[:box_id][0]}削除しました"
  end  
end
