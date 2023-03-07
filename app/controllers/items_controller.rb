class ItemsController < ApplicationController
  def index
    @item = Item.new
    @user = User.find(params[:user])
  end

  def message_params
    params.require(:item).permit(:content,:image).merge(user_id: current_user.id)
end
