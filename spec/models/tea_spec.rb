require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "Associations:" do
    it { should have_many(:subscription_teas) }
    it { should have_many(:subscriptions).through(:subscription_teas) }
    it { should have_many(:customers).through(:subscriptions) }
  end

  describe "Validations:" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(420) }
    it { should validate_presence_of(:instruction) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

end
