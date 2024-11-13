require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:frequency).is_greater_than(0).is_less_than(13) }
  end

  describe "Enum" do
    it { should define_enum_for(:status).with_values([:deactivated, :activated]) }
  end
end