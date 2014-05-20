class AddPreviousEventIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :previous_event_id, :integer
  end
end
