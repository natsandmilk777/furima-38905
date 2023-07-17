FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city_name { '東京都' }
    block_name { '青山１ー１ー１' }
    building_name { '東京ハイツ' }
    phone_number {' 09012345678 '}
    
  end
end
