class OrdersController < ApplicationController
  before_action :find_room_info, :get_new_order

  def new
    if check_order_empty?(order_params) || 1 > get_date_dif(@order)
      redirect_to room_path(params[:room_id]), alert: "入力内容に誤りがあります。"
    elsif Date.today > (@order.check_in || @order.check_out)
      redirect_to room_path(params[:room_id]), alert: "過去の日付は選択できません。"
    else
      get_date_dif(@order)
      get_price(@room)
      get_all_price(@order)
      country_name(@room.country)
    end
  end

  def create
    if @order.save
      redirect_to root_path, notice: "予約が完了いたしました。"
    else
      redirect_to new_room_order_path(order: order_params), flash: { error: @order.errors.full_messages }
    end
  end

  private

  def find_room_info
    @room = Room.find(params[:room_id])
  end

  def get_new_order
    @order = Order.new(order_params)
  end

  def get_date_dif(order)
    @dif = order.check_out - order.check_in
    @dif = @dif.to_i
  end

  def get_price(room)
    @price = (room.price * 1.08).round
  end

  def get_all_price(order)
    @prices = (@price * order.persons * @dif).round
  end

  def check_order_empty?(order)
    order[:persons].empty? ||(order[:check_in].empty?) || (order[:check_out].empty?)
  end

  def order_params
    params.require(:order).permit(:persons, :all_price, :check_in, :check_out, :messages, :confirmation).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
