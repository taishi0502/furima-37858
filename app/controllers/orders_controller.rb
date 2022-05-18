class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :edit]
  before_action :move_to_index2, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    
  end


  def create

    @order_address = OrderAddress.new(order_params)
   
    if @order_address.valid?
      @order_address.save
      
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address,  :building_name, :phone_num)
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

  end
  
end
