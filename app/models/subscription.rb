class Subscription < ApplicationRecord

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  validates_presence_of :title
  validates :price, numericality: { greater_than: 0 }
  validates :frequency, numericality: { greater_than: 0, less_than: 13 }

  enum :status, { deactivated: 0, activated: 1 }, validate: true

end