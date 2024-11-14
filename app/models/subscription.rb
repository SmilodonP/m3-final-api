class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas, dependent: :destroy
  has_many :teas, through: :subscription_teas

  validates_presence_of :title
  validates :frequency, numericality: { greater_than: 0, less_than: 13 }

  enum :status, { deactivated: 0, activated: 1 }, validate: true

  def total_price
    subscription_teas.sum(&:price)
  end

  def add_tea(tea, quantity = 1)
    existing_subscription_tea = subscription_teas.find_by(tea: tea)
    if existing_subscription_tea
      existing_subscription_tea.update!(quantity: existing_subscription_tea.quantity + quantity)
    else
      subscription_teas.create!(tea: tea, quantity: quantity)
    end
  end

end