FactoryBot.define do
  factory :order do

    city { '青森市' }
    postal_code { '111-1111' }
    address { '南北' }
    phone_num { '08080808080' }
    prefecture_id { 2 }
   
    building_name {'ビルの名前'}
    purchase_history_id  { 1 }
  
  
  
  end
end
