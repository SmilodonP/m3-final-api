class SetDefaultEnumStatus < ActiveRecord::Migration[7.1]
  def change
    change_column :subscriptions, :status, :integer, default: 0
  end
end
