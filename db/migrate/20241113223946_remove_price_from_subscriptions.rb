class RemovePriceFromSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :subscriptions, :price, :float
  end
end
