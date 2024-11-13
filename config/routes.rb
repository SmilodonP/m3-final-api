Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  # namespace :api do
  #   namespace :v1 do
  #     namespace :customers do
  #     resources :subscriptions, except: [:new, :create:]
  #     end
  #     namespace :subscriptions do

  #     end
  #     namespace :teas do

  #     end
  #   end
  # end
end
 