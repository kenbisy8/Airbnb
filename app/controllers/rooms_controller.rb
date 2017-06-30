class RoomsController < ApplicationController

  def index
    @rooms = Room.order('id DESC').limit(20)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    if @room.save
      redirect_to root_path, notice: "ホスティング登録が正常に完了しました。"
    else
      render 'new'
    end
  end

  def show
    @rooms = Room.find(params[:id])
    @order = Order.new
  end

  private

  def rooms_params
    params.require(:room).permit(:room_name, :country, :prefecture, :city, :address, :country, :prefecture, :city, :address, :room_type, :guest, :bed, :price, :image).merge(user_id: current_user.id)
  end
end
