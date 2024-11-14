FactoryBot.define do
  factory :subscription_tea do
    association :tea
    association :subscription
    quantity {Faker::Number.between(from: 1, to: 5)}
  end
end