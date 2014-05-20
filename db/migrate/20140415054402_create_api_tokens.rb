class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.integer :account_id
      t.string :token

      t.timestamps
    end
  end
end
