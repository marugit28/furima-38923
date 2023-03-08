FactoryBot.define do
  factory :user do
    nickname           { Faker::Name.initials(number: 2) }
    email              { Faker::Internet.free_email }
    password           { 'ty594rm2q' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
