class CreateCustomer < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.string :st_address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
