class Customer < ApplicationRecord

  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
  has_many :teas, through: :subscriptions

  validates_presence_of :first_name, :last_name
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, numericality: { only_integer: true }, length: { is: 10 }
  validates :st_address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, numericality: { only_integer: true }, length: { is: 5 }
 
end