class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_date

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, presence: true, numericality:  { other_than: 1, message: "Can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "Can't be blank" }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1, message: "Can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "Can't be blank" }
  validates :preparation_date_id, presence: true, numericality: { other_than: 1, message: "Can't be blank" }
end
