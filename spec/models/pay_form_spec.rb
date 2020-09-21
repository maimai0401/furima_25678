require 'rails_helper'
RSpec.describe PayForm, type: :model do
  before do
    @item_transaction = FactoryBot.build(:pay_form)
  end

  describe '購入情報の保存' do
    context '購入情報の保存がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_transaction).to be_valid
      end
    end

    context '購入情報の保存がうまくいかない時' do
      it 'クレジットカードの情報がなければ保存できない' do
        @item_transaction.token = nil
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がなければ保存できない' do
        @item_transaction.postal_code  = nil
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフンがなければ保存できない' do
        @item_transaction.postal_code  = 0000000
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県が選択されていなければ保存できない' do
        @item_transaction.prefecture_id = 1
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村がなければ保存できない' do
        @item_transaction.city = nil
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("City can't be blank")
      end
      it '番地がなければ保存できない' do
        @item_transaction.address = nil
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がなければ保存できない' do
        @item_transaction.tel = nil
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にはハイフンがあると保存できない' do
        @item_transaction.tel = '000-0000-00000'
        @item_transaction.valid?
        expect(@item_transaction.errors.full_messages).to include("Tel Too long")
      end
    end
  end
end



