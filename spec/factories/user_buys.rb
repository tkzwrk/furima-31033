FactoryBot.define do
  factory :user_buy do
    postal_code { '123-4567' }
    area_id { 2 }
    cities { '東京都' }
    add { '1-1' }
    bill_name { '東京ハイツ' }
    phone { '12312341234' }
  end
end