class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0, message: "can't be blank" } 
  validates :item_condition_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_date_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true
  validates :image, presence: true

end
