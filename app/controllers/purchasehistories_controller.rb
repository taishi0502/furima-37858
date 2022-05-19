class PurchasehistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :edit]
  before_action :move_to_index2, only: [:index]
  before_action :set_item
  def index
    
    @order_address = OrderAddress.new(purchase_params)
  end



  def create
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      
      render 'purchasehistories/index'
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :address,
       :building_name, :phone_num, :price).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address,
       :building_name, :phone_num, :price).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end


  def pay_item
    @item = Item.find(params[:item_id])
  
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
   
    Payjp::Charge.create(
      
      amount: (@item.price),  
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_index2  
    if @item.purchase_history.present?
      redirect_to root_path
    else
  end

  def set_item
    @item = Item.find(params[:item_id])
  end



 

end
end