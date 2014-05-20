class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.text :description
      t.integer :account_id

      t.timestamps
    end
  end
end
