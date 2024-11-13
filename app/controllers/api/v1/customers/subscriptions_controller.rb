class Api::V1::Customers::SubscriptionsController < ApplicationController
  def index
    subscriptions =  Subscription.all
  end

  def show
    subscription = Subscription.find(params[:subscription_id])
  end  

  def update

  end
  
  def destroy

  end
end