class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :postage
  belongs_to_active_hash :day


  validates :name, :explanation, :category_id, :status_id, :postage_id, :prefecture_id, :days_id, :price, :image, presence: true
  validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :status_id, :status_id, :prefecture_id, :days_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one_attached :image
end
