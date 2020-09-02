FactoryBot.define do
  factory :item do
    name {'test'}
    explanation {'説明文'}
    category_id { 2 }
    status_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    days_id { 2 }
    price { 1000 }
    association :user

    # after(:build) { |item| item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png') }

      
  end
end
