FactoryBot.define do
  factory :comment do
    association :user
    association :item
    comment { Faker::Lorem.paragraphs }
  end
end
