class FixCustomFieldType < ActiveRecord::Migration
  def change
    remove_column :custom_fields, :type
    add_column :custom_fields, :field_type, :string
  end
end
