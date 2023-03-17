class OrdersController < ApplicationController
  before_action :authenticate_user!,except: :index
  
  def index
    @item = Item.find(params[:item_id])
    @order_place = OrderPlace.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if  user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.order.present? 
      unless current_user.id == @item.user_id
      redirect_to root_path 
      end
    end
  end

  def new
    @order_place = OrderPlace.new

  end

  def create
    @item = Item.find(params[:item_id])
    @order_place = OrderPlace.new(order_params)
    if @order_place.valid?
      pay_item     
      @order_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_place).permit( :postcode, :region_id, :municipalities, :address, :building, :tell).merge(item_id: @item.id,user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],   
      currency: 'jpy'                 # 通貨の種類（日本円）
    ) 
  end
end
