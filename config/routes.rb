Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :teas, only: [:index, :show]
      resources :subscriptions do
        post 'add_tea', on: :member
      end
      # namespace :customers do
      #   resources :subscriptions, controller: "customers/subscriptions" do
      #     member do
      #       patch :activate
      #       patch :deactivate
      #     end
      #   end
      # namespace :teas do
      #   resources :find, only: :index, controller: :search, action: :show
      #   resources :find_all, only: :index, controller: :search
      # end
    end
  end
end
 