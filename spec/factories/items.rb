FactoryBot.define do
  factory :item do
    item_name           { Faker::Name.initials }
    explanation         {Faker::Lorem.sentence}
    category_id         {'2'}
    state_id            {'2'}
    region_id           {'2'}
    scheduled_delivery_id{'2'}
    shopping_fee_id      {'2'}
    price                {'700'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
