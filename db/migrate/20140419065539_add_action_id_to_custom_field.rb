class AddActionIdToCustomField < ActiveRecord::Migration
  def change
    add_column :custom_fields, :action_id, :integer
  end
end
