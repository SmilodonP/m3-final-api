class UpdateCustomersTable < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :phone, :string
    change_column :customers, :zip, :string

    change_column :customers, :state, :string, limit: 2

    add_index :customers, :email, unique: true
  end
end
