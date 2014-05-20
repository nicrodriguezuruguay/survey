class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :customer

	validates  :answer, :question_id, :presence => true
end
