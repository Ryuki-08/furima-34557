class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_index, only: :index

  def index
    @buys = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buys = BuyAddress.new(buy_address_params) # create = new + save
    if @buys.valid?
      pay_item
      @buys.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def buy_address_params
    params.require(:buy_address).permit(:postal_code, :prefectures_id, :municipality, :building_name, :house_number, :phone_number).merge(
      item_id: params[:item_id], token: params[:token], user_id: current_user.id
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || !@item.buy.nil?
  end
end
