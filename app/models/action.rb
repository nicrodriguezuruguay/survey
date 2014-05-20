class Action < ActiveRecord::Base
  belongs_to :account
  has_many :events, dependent: :destroy
  has_many :custom_fields, dependent: :destroy
end
