FactoryBot.define do
  factory :item do
    name                   { '商品' }
    text                   { 'ああ' }
    price                  { 3333 }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_charge_id     { 2 }
    area_id                { 2 }
    delivery_time_id       { 2 }
    association            :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/neko3.jpg'), filename: 'neko3.jpg')
    end
  end
end
