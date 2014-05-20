class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :account_id
      t.integer :customer_id
      t.integer :action_id

      t.timestamps
    end
  end
end
