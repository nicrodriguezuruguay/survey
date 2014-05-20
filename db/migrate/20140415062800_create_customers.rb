class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :account_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
