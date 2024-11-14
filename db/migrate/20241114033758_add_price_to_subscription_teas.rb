class AddPriceToSubscriptionTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :subscription_teas, :price, :float
  end
end
