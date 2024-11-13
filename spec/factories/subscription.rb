FactoryBot.define do
  factory :subscription do
    title { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 5.0..50.0) }
    status { [1] } 
    frequency { [1, 3, 6, 12].sample }  
  end
end