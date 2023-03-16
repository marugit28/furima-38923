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
    @order_place = OrderPlace.new(order_params)
    if @order_place.valid?
      @order_place.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_place).permit( :postcode, :region_id, :municipalities, :address, :building, :tell, :price).merge(user_id: current_user_id)
  end
end
