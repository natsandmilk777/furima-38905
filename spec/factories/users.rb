FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.user_name }
    email { Faker::Internet.free_email }
    password = "1a#{Faker::Internet.password(min_length: 6)}"
    password { password }
    password_confirmation { password }
    last_name { Gimei.last }
    first_name { Gimei.first }
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end