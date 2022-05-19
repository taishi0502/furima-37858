class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :token, :city, :address, :building_name, :phone_num, :purchase_history_id,  :item_id, :user_id

  with_options presence: true do
 
    validates :city
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address
    validates :phone_num, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :prefecture_id, numericality: {other_than: 1, message: "Can't be blank"}
    validates :token, presence: true
    validates :item_id
    validates :user_id
  end

 


  
  
  
  def save
    purchasehistory = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    Order.create( postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_num: phone_num, 
      purchase_history_id: purchasehistory.id)
  
  end

end