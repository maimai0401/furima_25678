class PayForm
  include ActiveModel::Model
  attr_accessor :item_id, :token, :postal_code, :prefecture_id, :city, :addresses, :building_name, :tel, :user_id

  # <<バリデーション>>
  with_options presence: true do
    validates :item_id
    validates :token, presence: { message: "can't be blank" }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :addresses
    validates :tel, length: { maximum: 11, message: 'Too long' }
    # 電話番号は入力フォームで制限してますが、一応つけています。
    validates :user_id
  end

  def save
    ItemTransaction.create(
      item_id: item_id,
      user_id: user_id
    )
    Address.create(
      item_id: item.id,
      postal_code: postal_code,
      prefecture: prefecture_id,
      city: city,
      addresses: addresses,
      building: building_name,
      phone_number: tel
    )
  end
end
