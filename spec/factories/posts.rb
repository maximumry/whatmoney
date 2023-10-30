FactoryBot.define do
  factory :post do
    asset {Faker::Number.between(to: 14)}
    text {Faker::Loren.sentence}
    association :user
  end
end