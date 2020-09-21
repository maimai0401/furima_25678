class PayForm
  include ActiveModel::Model
  attr_accessor :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building_name, :tel, :user_id

  # <<バリデーション>>
  with_options presence: true do
    validates :item_id
    validates :token, presence: { message: "can't be blank" }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :tel, length: { maximum: 11, message: 'Too long' }
    # 電話番号は入力フォームで制限してますが、一応つけています。
    validates :user_id
  end

  def save
    item_transaction = ItemTransaction.create!(
      item_id: item_id,
      user_id: user_id
    )
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      tel: tel,
      item_transaction_id: item_transaction.id
    )
  end
end
