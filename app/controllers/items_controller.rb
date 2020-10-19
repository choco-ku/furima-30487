class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

 def index
   @items = Item.all.order("created_at DESC")
 end
  
 def new 
    @item = Item.new
 end

 def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
 end


  private
  def item_params
    params.require(:item).permit(:name, :content, :image, :category_id, :condition_id, :shipping_fee_id, :shipping_place_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end 
