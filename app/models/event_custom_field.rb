class EventCustomField < ActiveRecord::Base
  belongs_to :custom_field
  belongs_to :event

  def action
    custom_field.action
  end
end
