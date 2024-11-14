class Api::V1::TeasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  def index
    teas = if params[:filtered]
             Tea.where(description: params[:filtered])
           else
             Tea.all
           end
    render json: TeaSerializer.new(teas), status: :ok
  end
  
  def show
    tea = Tea.find(params[:id])
    render json: TeaSerializer.new(tea), status: :ok
  end

private

  def not_found
    error_message = "Couldn't find Tea with 'id'=#{params[:id]}"
    render json: ErrorSerializer.format_errors([error_message]), status: :not_found
  end

  def unprocessable_entity(exception)
    render json: ErrorSerializer.format_errors([exception.message]), status: :unprocessable_entity
  end
end