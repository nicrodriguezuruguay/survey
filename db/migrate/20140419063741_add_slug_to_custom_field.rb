class AddSlugToCustomField < ActiveRecord::Migration
  def change
    add_column :custom_fields, :slug, :string
  end
end
