class OrdersController < ApplicationController
  before_action :authenticate_user!,except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_place = OrderPlace.new
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
    Payjp.api_key = "sk_test_5b31d8fbed4dbde860de9791" 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],   
      currency: 'jpy'                 # 通貨の種類（日本円）
    ) 
  end
end
