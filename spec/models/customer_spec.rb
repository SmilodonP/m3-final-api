require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "Association:" do
    it { should have_many(:subscriptions) }
    it { should have_many(:teas).through(:subscriptions) }
  end

  describe "Validation:" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should allow_value("email@example.com").for(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_numericality_of(:phone).only_integer }
    it { should validate_length_of(:phone).is_equal_to(10) }
    it { should validate_presence_of(:st_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_length_of(:state).is_equal_to(2) }
    it { should validate_numericality_of(:zip).only_integer }
    it { should validate_length_of(:zip).is_equal_to(5) }
  end

end