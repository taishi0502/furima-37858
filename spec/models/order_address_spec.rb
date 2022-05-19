require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
describe '商品の購入' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1 # 0.1秒待機
  end
    context '内容に問題ない場合' do
       it '問題なければ購入できる' do
         expect(@order_address).to be_valid
       end
       it '建物名が空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

    end
  
    context '商品の購入ができない場合' do
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'addressが空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では購入できない' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Can't be blank")
      end
      it '「--」が選択されている場合は購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.phone_num = '080808080'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid.")
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone_num = '0808080808080'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid.")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.phone_num = '０８０８０８０８０８０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid.")
      end


    
 

      
    end
  end

end
