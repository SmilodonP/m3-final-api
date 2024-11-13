class Tea < ApplicationRecord
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
  has_many :customers, through: :subscriptions

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 420 }
  validates :instruction, presence: true
  validates :price, numericality: { greater_than: 0 }
end