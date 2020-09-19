FactoryBot.define do
  factory :item_purchase do
    post_code      { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 1, to: 47) }
    city           { '島根県出雲市' }
    block          { '今市町6-6-6' }
    building       { '島根ハイツ101' }
    phone_number   { '09012341234' }
    token          { Faker::Internet.password(min_length: 20) }
  end
end
