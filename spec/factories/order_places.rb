FactoryBot.define do
  factory :order_place do
    item_id { '1' }
    user_id { '1' }
    postcode { '123-4567' }
    region_id { '2' }
    municipalities { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    tell { '1111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
