class DeleteAnalysesTable < ActiveRecord::Migration
  def change
    drop_table :analyses
  end
end
