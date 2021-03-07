class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_index, only: [:edit,:update]
  before_action :set_item, only: [:show, :edit, :update, :move_index]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :name_description, :category_id, :product_condition_id, :shipping_charges_id,
                                 :prefectures_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_index
    redirect_to action: :index unless current_user.id == @item.user.id
  end

   def set_item
     @item = Item.find(params[:id])
   end
end
