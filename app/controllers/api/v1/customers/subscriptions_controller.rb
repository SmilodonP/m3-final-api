class Api::V1::Customers::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  def index
    customer = find_customer
    subscriptions =  customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def show
    customer = find_customer
    subscription = find_subscription
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end  

  def create
    subscription = Subscription.create!(subscription_params)
    subscription.teas << find_teas
  
    total_price = SubscriptionTea.calculate_total_price(subscription)
    subscription.update(price: total_price)
  
    render json: SubscriptionSerializer.new(subscription), status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def update
    subscription = find_subscription
    subscription.teas << find_teas if params[:tea_ids]
  
    total_price = SubscriptionTea.calculate_total_price(subscription)
    if subscription.update(price: total_price)
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: ErrorSerializer.format_errors(["There was a problem updating your subscription. Please try again"])
    end
  end
  
  def destroy
    subscription = find_subscription
    subscription.destroy
    render json: { message: 'Subscription successfully deleted' }, status: :no_content
  end

  def activate
    subscription = find_subscription
    subscription.update!(status: :activated)
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end

  def deactivate
    subscription = find_subscription
    subscription.update!(status: :deactivated)
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end

private

  def find_subscription
    Subscription.find(params[:id])
  end
  
  def find_customer
    Customer.find(params[:id])
  end

  def find_teas
    Tea.find(params[:tea.ids])
  end

  def not_found
    render json: { error: 'Record not found' }, status: :not_found
  end
  
  def unprocessable_entity
    render json: { error: 'Record is invalid' }, status: :unprocessable_entity
  end
end