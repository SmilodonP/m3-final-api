FactoryBot.define do
  factory :subscription do
    title { Faker::Commerce.product_name }
    status { [0, 1].sample }
    frequency { [1, 3, 6, 12].sample }  
    association :customer
  end
end