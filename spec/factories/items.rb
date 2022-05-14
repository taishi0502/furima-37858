FactoryBot.define do
  factory :item do
    item_name { Faker::Name.last_name }
    item_description { '説明文' }
  
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    preparation_date_id { 2 }

    price { 1000 }

    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
