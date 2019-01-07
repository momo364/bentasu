class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def create
  end
end
