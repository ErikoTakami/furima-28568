FactoryBot.define do
  factory :user do
    nickname               {Faker::Internet.username}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    first_name             {"高見"}
    last_name              {"瑛里子"}
    first_name_kana        {"タカミ"}
    last_name_kana         {"エリコ"}
    birthday               {Faker::Date.between(from: '1900-01-01', to: Date.today)}
  end
end