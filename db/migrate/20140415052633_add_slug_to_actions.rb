class AddSlugToActions < ActiveRecord::Migration
  def change
    add_column :actions, :slug, :string
  end
end
