FactoryBot.define do
  factory :order_address do
    
    city { 'ああ市' }
    postal_code { '111-1111' }
    address { 'ああ' }
    phone_num { '08080808080' }
    prefecture_id { 2 }

    building_name {'ああ'}
    purchase_history_id  { 1 }
    item_id { 2 }
    user_id { 2 }
    token {"tok_8bd29c22fef21da5a1eaf02506c7"}
    
 
  
  
  
  end
end
