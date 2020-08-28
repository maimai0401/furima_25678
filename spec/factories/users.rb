FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'test1234'}
    password_confirmation {'test1234'}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_kana {'テスト'}
    last_name_kana {'ユーザー'}
    birthday {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end
