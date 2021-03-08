class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buys = Buy.all
    @item = Item.find(params[:item_id])
  end

  def create
    @buys = Buy.create(buy_params)
    Address.create(address_params)
  end

  private

  def buy_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefectures_id, :municipality, :building_name, :house_number, :phone_number,).merge(buy_id: @buy.id)
  end


end
