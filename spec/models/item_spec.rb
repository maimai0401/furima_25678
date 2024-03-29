require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it '全部入力されている時' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '画像が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空の時' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空の時' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリー情報が空の時' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリー選択で1が選ばれた時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態が空の時' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品状態選択で1が選ばれた時' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料情報が空の時' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '配送料情報選択で1が選ばれた時' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it '配送元情報が空の時' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送元情報選択で1が選ばれた時' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が空の時' do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it '発送までの日数選択で1が選ばれた時' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end
      it '価格が空の時' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円以下の時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9,999,999円以上の時' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
