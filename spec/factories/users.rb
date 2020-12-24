FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.initials(number: 2) }
    email                    { Faker::Internet.free_email }
    password                 { 'abc123' }
    password_confirmation    { password }
    family_name              { '佐藤' }
    given_name               { '花子' }
    family_name_kana         { 'サトウ' }
    given_name_kana          { 'ハナコ' }
    birthday                 { Faker::Date.backward }
  end
end