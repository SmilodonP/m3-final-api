class CreateTea < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.string :instruction
      t.float :price

      t.timestamps
    end
  end
end
