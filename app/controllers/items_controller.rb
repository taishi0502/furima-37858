class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]  
  def index
    @items = Item.order("created_at DESC")
  
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end


 def edit
  @item = Item.find(params[:id])
 end  

 def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path
  else
    
    render :edit

    
  end
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
    params.require(:item).permit(:item_name, :item_description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :preparation_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end
end
