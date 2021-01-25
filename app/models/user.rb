class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  JAPANESE_REGEX = /\A[ぁ-んァ-ン一-龥]/
  FULL_WIDTH_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname,:birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
    
    with_options format: { with: JAPANESE_REGEX } do
      validates :first_name, :last_name
    end

    with_options format: { with: FULL_WIDTH_REGEX } do
      validates :first_name_kana, :last_name_kana
    end
 end

  has_many :items
  has_many :item_transactions
end
