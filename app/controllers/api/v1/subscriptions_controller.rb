class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  def index
    subscriptions = Subscription.all
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def show
    subscription = find_subscription
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end

  def add_tea
    subscription = find_subscription
    tea = Tea.find_by(id: params[:tea_id])
  
    if tea.nil?
      render json: ErrorSerializer.format_errors(["Tea not found"]), status: :not_found
    else
      SubscriptionTea.create!(subscription: subscription, tea: tea, quantity: 1)
      render json: SubscriptionSerializer.new(subscription), status: :ok
    end
  end

private

def find_subscription
  Subscription.find(params[:id])
end

  def not_found(error)
    render json: ErrorSerializer.format_errors([error.message]), status: :not_found
  end

  def unprocessable_entity(error)
    render json: ErrorSerializer.format_errors([error.message]), status: :unprocessable_entity
  end
end