FactoryBot.define do
  factory :item_order do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { "123-4567" }
    prefecture_id { 2 }
    city_name { "テスト市" }
    block_name { "テスト町1-1" }
    building_name { "テストビル" }
    phone_number { "09012345678" }
    association :item
    association :user
  end
end
