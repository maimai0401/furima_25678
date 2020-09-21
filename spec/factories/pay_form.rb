FactoryBot.define do
  factory :pay_form do
    user_id { 1 }
    item_id { 1 }
    token { '4242424242424242' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '田中市' }
    address { '伊藤町' }
    building_name { '鈴木ビル' }
    tel      { '09000000000' }
  end
end

