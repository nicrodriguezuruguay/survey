class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.integer :account_id
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
