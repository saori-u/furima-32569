FactoryBot.define do
  factory :purchase_address do
    postcode          { Faker::Base.numerify('###-####') }
    area_id           { Faker::Number.within(range: 2..48) }
    city              { Faker::Address.city }
    house_num         { Faker::Address.city }
    building          { '建物名' }
    phone_num         { Faker::Base.numerify('0##########') }
    token             {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end