class PurchasesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_purchase


  def index
    @order_form = OrderForm.new
    if current_user.id == @item.user_id || @item.purchase != nil
       redirect_to root_path
    end
  end

  def create 
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
       pay_item
       @order_form.save
       redirect_to root_path
    else
      render :index
    end
  end


 private
  def purchase_params
    params.permit(:post_code, :shipping_place_id, :city, :house_num, :building, :telephone, :uer_id, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'
    )
  end

end
