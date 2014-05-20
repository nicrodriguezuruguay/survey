class Account < ActiveRecord::Base
  has_many :actions, dependent: :destroy
  has_many :user, dependent: :destroy
  has_many :api_tokens, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :custom_fields, dependent: :destroy
  has_many :survey, dependent: :destroy

  validates  :name, :presence => true

end
