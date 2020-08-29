class Item < ApplicationRecord
  validates :name, :explanation, :category_id, :status_id, :postage_id, :prefecture_id, :days_id, :price, presence: true
  validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  belongs_to :user
end
