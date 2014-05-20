class CreateEventCustomFields < ActiveRecord::Migration
  def change
    create_table :event_custom_fields do |t|
      t.integer :account_id
      t.integer :custom_field_id
      t.integer :event_id
      t.string :value

      t.timestamps
    end
  end
end
