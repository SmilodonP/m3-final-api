class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :status, :frequency

  attribute :price do |subscription|
    subscription.total_price
  end

  has_many :teas
end