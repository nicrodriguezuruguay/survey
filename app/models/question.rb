class Question < ActiveRecord::Base
	  belongs_to :survey
	  has_many :answer_default, dependent: :destroy
	  has_many :answer, dependent: :destroy

	  validates  :surveasy_id, :question, :presence => true

end
