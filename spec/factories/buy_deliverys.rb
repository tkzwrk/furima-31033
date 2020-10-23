FactoryBot.define do
  factory :buy_delivery do
    postal_code { '123-4567' }
    area_id { 2 }
    cities { '東京都' }
    add { '1-1' }
    bill_name { '東京ハイツ' }
    phone { '12312341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
