class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :teas, through: :subscriptions

  validates_presence_of :first_name, :last_name, :email, :st_address, :city, :state
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, numericality: { only_integer: true }, length: { is: 10 }
  validates :state, length: { is: 2 }
  validates :zip, numericality: { only_integer: true }, length: { is: 5 }
 
end