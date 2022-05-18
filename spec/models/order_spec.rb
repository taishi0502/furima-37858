require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品の購入' do
  
    context '商品の購入ができない場合' do
      it 'cityが空では購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase history must exist")
      end

      it 'postal_codeが空では購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase history must exist")
      end

      it 'addressが空では購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase history must exist")
      end

      it 'phone_numが空では購入できない' do
        @order.phone_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase history must exist")
      end

      it 'prefecture_idが空では購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase history must exist")
      end
      it '「--」が選択されている場合は購入できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase history must exist")
      end

    
 

      
    end
  end

end
