class RoomsController < ApplicationController

  def index
    @rooms = Room.find(1)
  end

  def new
  end

  def create
  end

  def show
    @rooms = Room.find(1)
  end
end
