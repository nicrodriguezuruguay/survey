class AddNameToApiTokens < ActiveRecord::Migration
  def change
    add_column :api_tokens, :name, :string
  end
end
