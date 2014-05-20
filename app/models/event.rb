class Event < ActiveRecord::Base
  belongs_to :account
  belongs_to :action
  belongs_to :customer
  belongs_to :previous_event,
             :class_name => 'Event'

  has_many :event_custom_fields,
           :dependent => :destroy

  before_save :find_previous_event

  def find_previous_event
    self.previous_event = customer.events.last
  end
end
