class Item < ApplicationRecord
  
  
 belongs_to :user
 has_one_attached :image
 


 extend ActiveHash::Associations::ActiveRecordExtensions
 
  belongs_to :Category
  belongs_to :condition
  belongs_to :DeliveryFee
  belongs_to :prefecture
  belongs_to :PreparationDate
  
  validates :image, presence: true
  validates :item_name,  presence: true
  validates :item_description,  presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  validates :category_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :condition_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :delivery_fee_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :prefecture_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :preparation_date_id, numericality:  { other_than: 1 , message: "Can't be blank"}
end