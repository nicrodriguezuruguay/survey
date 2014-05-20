class Survey < ActiveRecord::Base
	belongs_to :account
	has_many :question, dependent: :destroy

	validates  :account_id, :name, :presence => true

end
