class AddQuantityToSubscriptionTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :subscription_teas, :quantity, :integer
  end
end
