# Load the Rails application.
require File.expand_path('../application', __FILE__)
#config.action_mailer.delivery_method = :smtp
# Initialize the Rails application.
Surveasy::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app23739218@heroku.com',
  :password       => 'ch4mgtsq',
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

