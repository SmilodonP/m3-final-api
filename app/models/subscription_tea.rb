class SubscriptionTea < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def calculate_price
    quantity * tea.price
  end

  before_save :set_price

  private

  def set_price
    self.price = calculate_price
  end
end