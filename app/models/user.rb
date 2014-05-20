class User < ActiveRecord::Base
	belongs_to :account
	before_save :send_mail_password
	validates  :email, :password, :account_id, :presence => true


	def self.authenticate(email, password)
		token = Digest::SHA1.hexdigest(email + password + "1234")
		user = User.find_by_token(token)
		if user.valid?
			user
		else
			nil
		end
	end

	def send_mail_password
    	SendEmail.confirm_user_notification(self.email, generate_password).deliver
  	end

  	def generate_password
    	new_token = Digest::SHA1.hexdigest(self.email + "1234")
  	end


end