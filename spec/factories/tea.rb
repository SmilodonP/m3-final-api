FactoryBot.define do
  factory :tea do
    name {Faker::Tea.variety}
    description { Faker::Tea.type}
    instruction { "Water Temp: #{Faker::Number.between(from: 185, to: 212)}°F, Time: #{Faker::Number.between(from: 1, to: 5)} min" }
    price { Faker::Commerce.price(range: 5.0..20.0) }
  end
end