require 'factory_bot_rails'

50.times do
  FactoryBot.create(:tea)
end

20.times do
  FactoryBot.create(:customer)
end

20.times do
  FactoryBot.create(:subscription)
end

Subscription.all.each do |subscription|
  teas = Tea.order("RANDOM()").limit(rand(1..5))
  teas.each do |tea|
    FactoryBot.create(:subscription_tea, subscription: subscription, tea: tea)
  end
end

puts "Seeding complete!"

Faker::UniqueGenerator.clear