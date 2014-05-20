class ChangeFieldTypeForOnEvent < ActiveRecord::Migration
  def change
    remove_column :custom_fields, :field_type
    add_column :custom_fields, :on_event, :string, default: 'replace'
  end
end
