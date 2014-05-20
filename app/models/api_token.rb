class ApiToken < ActiveRecord::Base
  belongs_to :account

  after_create :generate_token

  private

  def generate_token
    token = Digest::SHA1.hexdigest("#{Time.now}+#{account.name}+1234")
    update_column(:token, token)
  end
end
