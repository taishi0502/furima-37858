class Item < ApplicationRecord
  
  
 belongs_to :user
 has_one_attached :image
 


 extend ActiveHash::Associations::ActiveRecordExtensions
 
  belongs_to :Category
  belongs_to :condition
  belongs_to :DeliveryFee
  belongs_to :prefecture
  belongs_to :PreparationDate

  validates :item_name,  presence: true
  validates :item_description,  presence: true
  validates :price, presence: true
  
  validates :category_id, numericality:  { other_than: 1 , message: "ジャンルを入力してください"}
  validates :condition_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :delivery_fee_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :prefecture_id, numericality:  { other_than: 1 , message: "Can't be blank"}
  validates :preparation_date_id, numericality:  { other_than: 1 , message: "Can't be blank"}
end