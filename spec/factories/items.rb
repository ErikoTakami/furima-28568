FactoryBot.define do
  factory :item do
    name                 { Faker::Games::Pokemon.name }
    text                 { Faker::Lorem.sentence }
    category             { Faker::Number.between(from: 1, to: 10) }
    status               { Faker::Number.between(from: 1, to: 6) }
    shipping_charges     { Faker::Number.between(from: 1, to: 2) }
    shipping_origin      { Faker::Number.between(from: 1, to: 47) }
    days_until_shipping  { Faker::Number.between(from: 1, to: 3) }
    price                { Faker::Number.between(from: 300, to: 9999999) }
  end
end
