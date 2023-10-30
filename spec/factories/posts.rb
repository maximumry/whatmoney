FactoryBot.define do
  factory :post do
    asset {Faker::Number.number(digits: 14)}
    text {Faker::Lorem.sentence}
    association :user
  end
end