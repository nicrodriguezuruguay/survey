class CustomField < ActiveRecord::Base
  REPLACE = 'replace'
  ADD_UP = 'addup'

  ON_EVENT_VALUES = [REPLACE, ADD_UP]

  validates_inclusion_of :on_event, in: ON_EVENT_VALUES

  belongs_to :action

  has_many :event_custom_fields,
           :dependent => :destroy
end
