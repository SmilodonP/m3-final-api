require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "Relationships:" do
    it { should belong_to(:customer) }
    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas) }
  end

  describe "Validations:" do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:frequency).is_greater_than(0).is_less_than(13) }
  end

  describe "Enum" do
    it { should define_enum_for(:status).with_values([:deactivated, :activated]) }
  end

  describe '#total_price' do
    it 'calculates a positive total price based on associated teas and quantities' do
      subscription = create(:subscription)
      tea1 = create(:tea, price: 5.0)
      tea2 = create(:tea, price: 10.0)

      subscription.subscription_teas.create!(tea: tea1, quantity: 2)
      subscription.subscription_teas.create!(tea: tea2, quantity: 1)

      expect(subscription.total_price).to eq(20.0)
    end
  end
end