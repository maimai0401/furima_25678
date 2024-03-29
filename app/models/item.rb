class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :postage
  belongs_to_active_hash :day

  validates :name, :explanation, :category_id, :status_id, :postage_id, :prefecture_id, :day_id, :price, :images, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :status_id, :postage_id, :status_id, :prefecture_id, :day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_many_attached :images
  has_one :item_transaction
end
