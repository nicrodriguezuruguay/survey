class SendEmail < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack
  sendgrid_unique_args :key1 => "value1", :key2 => "value2"

  def confirm_user_notification(email,password)
    sendgrid_category "Welcome to Survey!!"
    @password_encript=password
    sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    mail({
          :to => email,
          :subject => "Welcome :-)",
          :from => "nicolaselpaladin@gmail.com"
    })

  end

  def recover_password_notification(email,password)

  end

end
