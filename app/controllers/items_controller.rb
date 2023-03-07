class ItemsController < ApplicationController
  def index
    @items = Item.all
    # @user = User.find(params[:user])
    # @items = @user.items.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :state_id, :region_id, :scheduled_delivery_id, :shopping_fee_id, :user, :price)
  end
  end
